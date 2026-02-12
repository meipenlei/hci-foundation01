keyvaults = {
  kv1 = {
    name                      = "dc2"
    resource_group_key        = "rg1"
    sku_name                  = "standard"
    purge_protection_enabled  = false
    enable_rbac_authorization = true
    network = {
      bypass         = "AzureServices"
      default_action = "Deny"
      ip_rules       = [] #optional. The prefix of ip_rules must be between 0 and 30 and only supports public IP addresses.
      subnets = {
        # subnet1 = {
        #   vnet_key   = "spoke1"
        #   subnet_key = "frontend"
        # }
        #add multiple subnets by extending this block. You can reference remote subnets by using subnet_id
        subnet1 = {
          subnet_id = "/subscriptions/ph_identity_subscription_id/resourceGroups/ph_prefix-rg-self-hosted-level0/providers/Microsoft.Network/virtualNetworks/ph_prefix-vnet-mdp/subnets/ph_prefix-snet-frontend"
        }
      }
    }
  }
}

# Store output attributes into keyvault secret
dynamic_keyvault_secrets = {
  kv1 = { # Key of the keyvault
    admin-username = {
      secret_name = "admin-username"
      value       = "adminuser"
    }
    admin-password = {
      secret_name = "admin-password"
      value       = "dynamic"
      config = {
        length           = 123
        min_upper        = 2
        min_lower        = 2
        min_special      = 2
        numeric          = true
        special          = true
        override_special = "!@#$%&"
      }
    }
  }
}
