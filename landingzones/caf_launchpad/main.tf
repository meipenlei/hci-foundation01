terraform {
  required_providers {
    // azurerm version driven by the caf module
    // azuread version driven by the caf module
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7.1"
    }
    external = {
      source  = "hashicorp/external"
      version = "~> 2.2.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 3.1.0"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "~> 1.2.0"
    }
  }
  required_version = ">= 1.8.0"
}

data "azurerm_client_config" "current" {}

provider "azuread" {
}

provider "azurerm" {

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

  features {
    api_management {
      purge_soft_delete_on_destroy = try(var.provider_azurerm_features_api_management.purge_soft_delete_on_destroy, null)
      # recover_soft_deleted_api_managements = var.provider_azurerm_features_api_management.recover_soft_deleted_api_managements
    }
    cognitive_account {
      purge_soft_delete_on_destroy = var.provider_azurerm_features_cognitive_account.purge_soft_delete_on_destroy
    }
    key_vault {
      purge_soft_delete_on_destroy                            = try(var.provider_azurerm_features_keyvault.purge_soft_delete_on_destroy, true)
      purge_soft_deleted_certificates_on_destroy              = try(var.provider_azurerm_features_keyvault.purge_soft_deleted_certificates_on_destroy, null)
      purge_soft_deleted_keys_on_destroy                      = try(var.provider_azurerm_features_keyvault.purge_soft_deleted_keys_on_destroy, null)
      purge_soft_deleted_secrets_on_destroy                   = try(var.provider_azurerm_features_keyvault.purge_soft_deleted_secrets_on_destroy, null)
      purge_soft_deleted_hardware_security_modules_on_destroy = try(var.provider_azurerm_features_keyvault.purge_soft_deleted_hardware_security_modules_on_destroy, null)
      recover_soft_deleted_certificates                       = try(var.provider_azurerm_features_keyvault.recover_soft_deleted_certificates, null)
      recover_soft_deleted_key_vaults                         = try(var.provider_azurerm_features_keyvault.recover_soft_deleted_key_vaults, true)
      recover_soft_deleted_keys                               = try(var.provider_azurerm_features_keyvault.recover_soft_deleted_keys, null)
      recover_soft_deleted_secrets                            = try(var.provider_azurerm_features_keyvault.recover_soft_deleted_secrets, null)
    }
    # log_analytics_workspace {
    #   permanently_delete_on_destroy = var.provider_azurerm_features_log_analytics_workspace.permanently_delete_on_destroy
    # }
    resource_group {
      prevent_deletion_if_contains_resources = var.provider_azurerm_features_resource_group.prevent_deletion_if_contains_resources
    }
    template_deployment {
      delete_nested_items_during_deletion = var.provider_azurerm_features_template_deployment.delete_nested_items_during_deletion
    }
    virtual_machine {
      delete_os_disk_on_deletion     = var.provider_azurerm_features_virtual_machine.delete_os_disk_on_deletion
      skip_shutdown_and_force_delete = var.provider_azurerm_features_virtual_machine.skip_shutdown_and_force_delete
    }
    virtual_machine_scale_set {
      force_delete                  = var.provider_azurerm_features_virtual_machine_scale_set.force_delete
      roll_instances_when_required  = var.provider_azurerm_features_virtual_machine_scale_set.roll_instances_when_required
      scale_to_zero_before_deletion = var.provider_azurerm_features_virtual_machine_scale_set.scale_to_zero_before_deletion
    }
  }
}

resource "random_string" "prefix" {
  count   = var.prefix == null ? 1 : 0
  length  = 4
  special = false
  upper   = false
  numeric = false
}

locals {
  landingzone_tag = {
    "landingzone" = var.landingzone.key
  }

  tags = merge(local.global_settings.tags, local.landingzone_tag, { "caf_environment" = local.global_settings.environment }, { "rover_version" = var.rover_version }, var.tags)

  global_settings = {
    default_region     = var.default_region
    environment        = var.environment
    inherit_tags       = var.inherit_tags
    passthrough        = var.passthrough
    prefix             = var.prefix
    suffix             = var.suffix
    prefixes           = var.prefix == "" ? null : [try(random_string.prefix.0.result, var.prefix)]
    prefix_with_hyphen = var.prefix == "" ? null : format("%s", try(random_string.prefix.0.result, var.prefix))
    random_length      = var.random_length
    regions            = var.regions
    tags               = var.tags
    use_slug           = var.use_slug
  }

  tfstates = tomap(
    {
      (var.landingzone.key) = local.backend[var.landingzone.backend_type]
    }
  )

  backend = {
    azurerm = {
      storage_account_name = module.launchpad.storage_accounts[var.launchpad_key_names.tfstates[0]].name
      container_name       = module.launchpad.storage_accounts[var.launchpad_key_names.tfstates[0]].containers["tfstate"].name
      resource_group_name  = module.launchpad.storage_accounts[var.launchpad_key_names.tfstates[0]].resource_group_name
      key                  = var.tf_name
      level                = var.landingzone.level
      tenant_id            = data.azurerm_client_config.current.tenant_id
      subscription_id      = data.azurerm_client_config.current.subscription_id
    }
    remote = {
      hostname     = try(var.tfstate_hostname, "app.terraform.io")
      organization = var.tfstate_organization
      workspaces = {
        name = var.workspace
      }
    }
  }

}
