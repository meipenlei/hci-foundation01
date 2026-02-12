
keyvaults = {
  ssh = {
    name = "agentl0"
    resource_group = {
      lz_key = "launchpad"
      key    = "rg1"
    }
    sku_name                  = "standard"
    soft_delete_enabled       = false
    purge_protection_enabled  = false
    enable_rbac_authorization = true
    network = {
      bypass         = "AzureServices"
      default_action = "Deny"
      ip_rules       = [] #optional. The prefix of ip_rules must be between 0 and 30 and only supports public IP addresses.
      subnets = {
        # subnet1 = {
        #   lz_key     = "launchpad"
        #   vnet_key   = "spoke1"
        #   subnet_key = "frontend"
        # }
      }
    }
  }
}
