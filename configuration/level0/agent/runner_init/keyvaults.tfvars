
keyvaults = {
  ssh = {
    name = "agentl0"
    resource_group = {
      #lz_key = "launchpad"
      key = "rg1"
    }
    sku_name                  = "standard"
    purge_protection_enabled  = false
    soft_delete_enabled       = false
    enable_rbac_authorization = true
  }
}