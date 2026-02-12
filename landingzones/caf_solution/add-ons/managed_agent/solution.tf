module "caf" {
  #source = "../../../../SuperModule"
  source = "git::https://github.com/meipenlei/cloudenabler-supermodule.git//?ref=main"

  current_landingzone_key = var.landingzone.key
  tenant_id               = var.tenant_id
  tfstates                = local.tfstates
  global_settings         = local.global_settings
  resource_groups         = var.resource_groups
  networking              = local.networking


  remote_objects = {
    vnets              = local.remote.vnets
    managed_identities = local.remote.managed_identities
    resource_groups    = local.remote.resource_groups
  }
}

output "caf" {
  value = module.caf
}