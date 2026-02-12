module "dynamic_keyvault_secrets" {
  # source  = "aztfmod/caf/azurerm//modules/security/dynamic_keyvault_secrets"
  # version = "5.7.14"
  source = "git::https://github.com/meipenlei/cloudenabler-supermodule.git//modules/security/dynamic_keyvault_secrets?ref=main"
  # source = "/tf/caf/SuperModule/modules/security/dynamic_keyvault_secrets"

  for_each = {
    for keyvault_key, secrets in try(var.dynamic_keyvault_secrets, {}) : keyvault_key => {
      for key, value in secrets : key => value
      if try(value.value, null) == null
    }
  }

  settings = each.value
  keyvault = module.solution.keyvaults[each.key]
  objects  = module.solution

  depends_on = []
}
