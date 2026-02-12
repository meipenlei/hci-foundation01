# locals {
#   location            = var.location
#   resource_group_name = var.resource_group_name
# }

# Lookup both possible DevOpsInfrastructure service principals
locals {

  effective_client_id = var.client_id != null ? var.client_id : data.azurerm_client_config.current.client_id

  global_settings = merge(
    var.global_settings,
    try(data.terraform_remote_state.remote[var.landingzone.global_settings_key].outputs.objects[var.landingzone.global_settings_key].global_settings, null),
    try(data.terraform_remote_state.remote[var.landingzone.global_settings_key].outputs.global_settings, null),
    #try(data.terraform_remote_state.remote[keys(var.landingzone.tfstates)[0]].outputs.global_settings, null),
    #local.custom_variables,
    var.global_settings_override
  )

  resource_group_name = {
    for agent_key, agent in var.managed_agent :
    agent_key => module.caf.resource_groups[agent.resource_group_key].name
  }

  combined_objects_resource_groups = merge(tomap({ (var.current_landingzone_key) = merge(var.resource_groups, lookup(var.data_sources, "resource_groups", {})) }), lookup(var.remote_objects, "resource_groups", {}))

  subnet_id = module.caf.vnets["spoke1"].subnets["frontend"].id

  agent_sp_pairs = flatten([
    for agent_key in keys(var.managed_agent) : [
      for sp in local.devopsinfra_names : {
        agent_key = agent_key
        sp_name   = sp
      }
    ]
  ])

  devopsinfra_names = ["DevOpsInfrastructure", "DevOpsInfrastructure PPE"]

  remote_managed_identities = {
    for key, value in try(var.landingzone.tfstates, {}) :
    key => merge(try(data.terraform_remote_state.remote[key].outputs.objects[key].managed_identities, {}))
  }

  # Flatten all managed identity IDs into a list
  managed_identities = flatten([
    for lz_key, identities in local.remote_managed_identities : [
      for id_key, mi in identities : mi.id
    ]
  ])

  remote = {
    managed_identities = local.remote_managed_identities
    vnets = {
      for key, value in try(var.landingzone.tfstates, {}) :
      key => merge(try(data.terraform_remote_state.remote[key].outputs.objects[key].vnets, {}))
    }
    resource_groups = {
      for key, value in try(var.landingzone.tfstates, {}) :
      key => merge(try(data.terraform_remote_state.remote[key].outputs.objects[key].resource_groups, {}))
    }
  }

  landingzone = {
    current = {
      storage_account_name = var.tfstate_storage_account_name
      container_name       = var.tfstate_container_name
      resource_group_name  = var.tfstate_resource_group_name
    }
    lower = {
      storage_account_name = var.lower_storage_account_name
      container_name       = var.lower_container_name
      resource_group_name  = var.lower_resource_group_name
    }
  }

  # Update the tfstates map
  tfstates = merge(
    tomap(
      {
        (try(var.landingzone.key, var.landingzone[var.backend_type].key)) = local.backend[try(var.landingzone.backend_type, var.backend_type)]
      }
    )
    ,
    try(data.terraform_remote_state.remote[var.landingzone.global_settings_key].outputs.tfstates, {})
  )

  backend = {
    azurerm = {
      storage_account_name = var.tfstate_storage_account_name
      container_name       = var.tfstate_container_name
      resource_group_name  = var.tfstate_resource_group_name
      key                  = var.tfstate_key
      level                = var.landingzone.level
      tenant_id            = var.tenant_id
      subscription_id      = data.azurerm_client_config.current.subscription_id
    }
  }

}

data "terraform_remote_state" "remote" {
  for_each = try(var.landingzone.tfstates, {})

  backend = var.landingzone.backend_type
  config = {
    storage_account_name = local.landingzone[try(each.value.level, "current")].storage_account_name
    container_name       = local.landingzone[try(each.value.level, "current")].container_name
    resource_group_name  = local.landingzone[try(each.value.level, "current")].resource_group_name
    subscription_id      = var.tfstate_subscription_id
    key                  = each.value.tfstate
  }
}
