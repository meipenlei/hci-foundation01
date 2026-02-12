data "azurerm_subscription" "current" {}

provider "azuredevops" {
  org_service_url       = var.azure_PRODops.url
  personal_access_token = try(var.azure_PRODops.personal_access_token, null)
  use_msi               = try(var.azure_PRODops.use_msi, false)
}

data "azuredevops_project" "cef" {
  name = var.azure_PRODops.project
}

locals {
  identity_map = regex(
    "(?i)^/Subscriptions/(?P<subscription_id>[^/]+)/resourceGroups/(?P<resource_group>[^/]+)/providers/(?P<provider>[^/]+)/.+/(?P<resource_name>.+)$",
    local.remote.managed_identities[var.azure_PRODops.service_connection.lz_key][var.azure_PRODops.service_connection.identity_key].id
  )
}

resource "azuredevops_serviceendpoint_azurerm" "agent" {
  depends_on = [module.caf]

  project_id                             = data.azuredevops_project.cef.id
  service_endpoint_name                  = var.azure_PRODops.service_connection.name
  description                            = "Managed by Terraform"
  service_endpoint_authentication_scheme = "WorkloadIdentityFederation"
  credentials {
    serviceprincipalid = local.remote.managed_identities[var.azure_PRODops.service_connection.lz_key][var.azure_PRODops.service_connection.identity_key].client_id
  }
  azurerm_spn_tenantid      = data.azurerm_subscription.current.tenant_id
  azurerm_subscription_id   = data.azurerm_subscription.current.subscription_id
  azurerm_subscription_name = data.azurerm_subscription.current.display_name
}

resource "azurerm_federated_identity_credential" "agent" {
  depends_on = [module.caf]

  name                = "agentl0sp"
  resource_group_name = local.identity_map.resource_group
  parent_id           = local.remote.managed_identities[var.azure_PRODops.service_connection.lz_key][var.azure_PRODops.service_connection.identity_key].id
  audience            = ["api://AzureADTokenExchange"]
  issuer              = azuredevops_serviceendpoint_azurerm.agent.workload_identity_federation_issuer
  subject             = azuredevops_serviceendpoint_azurerm.agent.workload_identity_federation_subject
}

resource "time_sleep" "pool_delay" {
  depends_on = [azurerm_federated_identity_credential.agent]

  create_duration = "120s"
}

resource "azuredevops_elastic_pool" "agent" {
  depends_on = [module.caf, time_sleep.pool_delay]

  name                   = var.azure_PRODops.agent_pool.name
  service_endpoint_id    = azuredevops_serviceendpoint_azurerm.agent.id
  service_endpoint_scope = data.azuredevops_project.cef.id
  desired_idle           = 0
  auto_provision         = true
  max_capacity           = var.azure_PRODops.agent_pool.num_agents
  azure_resource_id      = module.caf.virtual_machine_scale_sets.level0.id
}

resource "azuredevops_agent_queue" "agent_queue" {
  project_id    = data.azuredevops_project.cef.id
  agent_pool_id = azuredevops_elastic_pool.agent.id
}
