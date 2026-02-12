# Use external data to check resource provider registration status
data "external" "check_devcenter_registration" {
  program = ["bash", "-c", <<-EOT
    registration_state=$(az provider show --namespace Microsoft.DevCenter --query registrationState -o tsv 2>/dev/null || echo "NotRegistered")
    echo "{\"registration_state\": \"$registration_state\"}"
  EOT
  ]
}

data "external" "check_devopsinfra_registration" {
  program = ["bash", "-c", <<-EOT
    registration_state=$(az provider show --namespace Microsoft.DevOpsInfrastructure --query registrationState -o tsv 2>/dev/null || echo "NotRegistered")
    echo "{\"registration_state\": \"$registration_state\"}"
  EOT
  ]
}

# Conditionally register providers only if they're not already registered
resource "azurerm_resource_provider_registration" "devcenter" {
  count = data.external.check_devcenter_registration.result.registration_state != "Registered" ? 1 : 0
  name  = "Microsoft.DevCenter"
}

resource "azurerm_resource_provider_registration" "devopsinfrastructure" {
  count = data.external.check_devopsinfra_registration.result.registration_state != "Registered" ? 1 : 0
  name  = "Microsoft.DevOpsInfrastructure"
}

# Add a time delay to allow Azure to create the service principals after registration
resource "time_sleep" "wait_for_sp_creation" {
  depends_on = [
    azurerm_resource_provider_registration.devcenter,
    azurerm_resource_provider_registration.devopsinfrastructure
  ]

  create_duration = "60s" # Wait 60 seconds for service principals to be created
}

# Now try to find the service principals after registration and delay
data "azuread_service_principal" "devopsinfra" {
  for_each     = toset(local.devopsinfra_names)
  display_name = each.value

  depends_on = [
    azurerm_resource_provider_registration.devcenter,
    azurerm_resource_provider_registration.devopsinfrastructure,
    time_sleep.wait_for_sp_creation
  ]
}

# Rest of your configuration remains the same...
data "azurerm_resource_group" "this" {
  for_each = var.managed_agent
  name     = local.resource_group_name[each.key]
}

data "azuredevops_project" "ado_project" {
  for_each = var.managed_agent
  name     = each.value.ado_project
}

# Get the VNet (if not already available as a variable or output)
data "azurerm_virtual_network" "target" {
  for_each            = var.managed_agent
  name                = module.caf.vnets[each.value.vnet_key].name
  resource_group_name = local.resource_group_name[each.key]
}

# Assign Reader and Network Contributor roles to each found SP
resource "azurerm_role_assignment" "devopsinfra_reader" {
  for_each = {
    for pair in local.agent_sp_pairs : "${pair.agent_key}.${pair.sp_name}" => pair
  }
  principal_id         = data.azuread_service_principal.devopsinfra[each.value.sp_name].object_id
  role_definition_name = "Reader"
  scope                = data.azurerm_virtual_network.target[each.value.agent_key].id

  depends_on = [
    azapi_resource.devcenter,
    azapi_resource.devcenter_project
  ]
}

resource "azurerm_role_assignment" "devopsinfra_netcontrib" {
  for_each = {
    for pair in local.agent_sp_pairs : "${pair.agent_key}.${pair.sp_name}" => pair
  }
  principal_id         = data.azuread_service_principal.devopsinfra[each.value.sp_name].object_id
  role_definition_name = "Network Contributor"
  scope                = data.azurerm_virtual_network.target[each.value.agent_key].id

  depends_on = [
    azapi_resource.devcenter,
    azapi_resource.devcenter_project
  ]
}

###############################################################################
# Dev Center (must exist before Dev Center Project)
###############################################################################
resource "azapi_resource" "devcenter" {
  depends_on = [
    azurerm_resource_provider_registration.devcenter,
    azurerm_resource_provider_registration.devopsinfrastructure
  ]

  lifecycle {
    ignore_changes = [tags]
  }

  type      = "Microsoft.DevCenter/devcenters@2024-02-01"
  name      = var.devcenter_name
  location  = module.caf.resource_groups[var.managed_agent["agent1"].resource_group_key].location
  parent_id = data.azurerm_resource_group.this["agent1"].id

  body = {
    properties = {
      displayName = "ADO Dev Center"
    }
  }
}

###############################################################################
# Dev Center Project (the pool needs this as an anchor resource)
###############################################################################
resource "azapi_resource" "devcenter_project" {
  type       = "Microsoft.DevCenter/projects@2024-02-01"
  name       = var.devcenter_project_name
  depends_on = [azapi_resource.devcenter]
  location   = module.caf.resource_groups[var.managed_agent["agent1"].resource_group_key].location
  parent_id  = data.azurerm_resource_group.this["agent1"].id

  body = {
    properties = {
      description = "Project for Managed DevOps Pool"
      devCenterId = azapi_resource.devcenter.id
    }
  }
}

###############################################################################
# Managed DevOps Pool pulled from Azure Verified Modules  🎉
###############################################################################
module "mdp" {
  source  = "Azure/avm-res-devopsinfrastructure-pool/azurerm"
  version = ">=0.2.2"

  for_each = var.managed_agent

  resource_group_name            = local.resource_group_name[each.key]
  location                       = module.caf.resource_groups[each.value.resource_group_key].location
  name                           = each.value.name
  dev_center_project_resource_id = azapi_resource.devcenter_project.id
  subnet_id                      = local.subnet_id
  fabric_profile_sku_name        = each.value.fabric_profile_sku_name
  maximum_concurrency            = each.value.max_agents

  # Add your managed identity here
  managed_identities = {
    system_assigned            = false
    user_assigned_resource_ids = local.managed_identities
  }

  # Your Azure DevOps org + projects:
  organization_profile = {
    organizations = [{
      name     = each.value.ado_org
      projects = [each.value.ado_project]
    }]
  }

  agent_profile_kind                   = "Stateful"
  agent_profile_grace_period_time_span = "00:30:00"

  fabric_profile_os_profile_logon_type = "Interactive"

  # Images that should be available in pipelines (including Ubuntu 22.04)
  fabric_profile_images = [
    {
      well_known_image_name = "ubuntu-22.04/latest"
      aliases               = ["ubuntu-22.04"]
    },
    {
      well_known_image_name = "windows-2022/latest"
      aliases               = ["windows-2022"]
    }
  ]

  depends_on = [
    azurerm_resource_provider_registration.devcenter,
    azurerm_resource_provider_registration.devopsinfrastructure,
    time_sleep.wait_for_sp_creation
  ]
}

###############################################################################
# Wait for Azure DevOps pool registration
###############################################################################
resource "time_sleep" "wait_for_pool_registration" {
  depends_on = [module.mdp]

  create_duration = "60s" # Wait 1 minutes for pool to register in Azure DevOps
}

###############################################################################
# Create pipeline queue in the project
###############################################################################
resource "azuredevops_agent_queue" "queue" {
  for_each   = var.managed_agent
  project_id = data.azuredevops_project.ado_project[each.key].id
  name       = each.value.name

  depends_on = [module.mdp, time_sleep.wait_for_pool_registration]
}

###############################################################################
# Authorize pipeline queue in the project
###############################################################################
resource "azuredevops_pipeline_authorization" "allow_bootstrap" {
  for_each    = azuredevops_agent_queue.queue
  project_id  = data.azuredevops_project.ado_project[each.key].id
  resource_id = each.value.id
  type        = "queue"
  pipeline_id = null # or your pipeline id

  depends_on = [azuredevops_agent_queue.queue]
}
