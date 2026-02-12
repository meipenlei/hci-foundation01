module "caf" {
  # source  = "aztfmod/caf/azurerm"
  # version = "5.7.14"
  # source = "git::https://github.com/aztfmodnew/terraform-azurerm-caf/?ref=main"
  source = "../../../../SuperModule"

  providers = {
    azurerm.vhub = azurerm.vhub
  }

  azuread                     = local.azuread
  current_landingzone_key     = var.landingzone.key
  tenant_id                   = var.tenant_id
  tfstates                    = local.tfstates
  tags                        = local.tags
  global_settings             = local.global_settings
  diagnostics                 = local.diagnostics
  diagnostic_storage_accounts = var.diagnostic_storage_accounts
  logged_user_objectId        = var.logged_user_objectId
  logged_aad_app_objectId     = var.logged_aad_app_objectId
  resource_groups             = var.resource_groups
  storage_accounts            = var.storage_accounts
  keyvaults                   = var.keyvaults
  keyvault_access_policies    = var.keyvault_access_policies
  managed_identities          = var.managed_identities
  role_mapping                = var.role_mapping
  custom_role_definitions     = var.custom_role_definitions
  compute = {
    virtual_machine_scale_sets = var.virtual_machine_scale_sets
  }
  storage = {
    storage_account_blobs = var.storage_account_blobs
  }

  networking = {
    network_security_group_definition = var.network_security_group_definition
    vnets                             = var.vnets
  }

  # Pass the remote objects you need to connect to.
  remote_objects = {
    keyvaults           = local.remote.keyvaults
    vnets               = local.remote.vnets
    managed_identities  = local.remote.managed_identities
    azuread_groups      = local.remote.azuread_groups
    resource_groups     = local.remote.resource_groups
    public_ip_addresses = local.remote.public_ip_addresses
    public_ip_prefixes  = local.remote.public_ip_prefixes
  }
}
