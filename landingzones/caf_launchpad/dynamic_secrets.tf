
module "dynamic_keyvault_secrets" {
  # source  = "aztfmod/caf/azurerm//modules/security/dynamic_keyvault_secrets"
  # version = "5.7.14"
  source = "git::https://github.com/meipenlei/cloudenabler-supermodule.git//modules/security/dynamic_keyvault_secrets?ref=main"
  # source = "/tf/caf/SuperModule/modules/security/dynamic_keyvault_secrets"

  for_each = try(var.dynamic_keyvault_secrets, {})

  settings = each.value
  keyvault = module.launchpad.keyvaults[each.key]
  objects  = module.launchpad

  depends_on = []
}
