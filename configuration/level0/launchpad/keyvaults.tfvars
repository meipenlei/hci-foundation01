
keyvaults = {
  level0 = {
    name                      = "l0"
    resource_group_key        = "level0"
    sku_name                  = "standard"
    purge_protection_enabled  = true
    soft_delete_enabled       = true
    enable_rbac_authorization = true
    tags = {
      caf_tfstate     = "level0"
      caf_environment = "ph_environment"
    }
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

  level1 = {
    name                      = "l1"
    resource_group_key        = "level1"
    sku_name                  = "standard"
    purge_protection_enabled  = true
    soft_delete_enabled       = true
    enable_rbac_authorization = true
    tags = {
      caf_tfstate     = "level1"
      caf_environment = "ph_environment"
    }
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

  level2 = {
    name                      = "l2"
    resource_group_key        = "level2"
    sku_name                  = "standard"
    purge_protection_enabled  = true
    soft_delete_enabled       = true
    enable_rbac_authorization = true
    tags = {
      caf_tfstate     = "level2"
      caf_environment = "ph_environment"
    }
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

  level3 = {
    name                      = "l3"
    resource_group_key        = "level3"
    sku_name                  = "standard"
    purge_protection_enabled  = true
    soft_delete_enabled       = true
    enable_rbac_authorization = true
    tags = {
      caf_tfstate     = "level3"
      caf_environment = "ph_environment"
    }
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

  level4 = {
    name                      = "l4"
    resource_group_key        = "level4"
    sku_name                  = "standard"
    purge_protection_enabled  = true
    soft_delete_enabled       = true
    enable_rbac_authorization = true
    tags = {
      caf_tfstate     = "level4"
      caf_environment = "ph_environment"
    }
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

  "cred_level0" = {
    name                      = "idl0"
    resource_group_key        = "sp_credentials"
    sku_name                  = "standard"
    purge_protection_enabled  = true
    soft_delete_enabled       = true
    enable_rbac_authorization = true
    tags = {
      caf_environment      = "ph_environment"
      caf_identity_aad_key = "cred_level0"
    }
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

  "cred_identity" = {
    name                      = "id"
    resource_group_key        = "sp_credentials"
    sku_name                  = "standard"
    purge_protection_enabled  = true
    soft_delete_enabled       = true
    enable_rbac_authorization = true
    tags = {
      caf_environment      = "ph_environment"
      caf_identity_aad_key = "cred_identity"
    }
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

  "cred_management" = {
    name                      = "mg"
    resource_group_key        = "sp_credentials"
    sku_name                  = "standard"
    purge_protection_enabled  = true
    soft_delete_enabled       = true
    enable_rbac_authorization = true
    tags = {
      caf_environment      = "ph_environment"
      caf_identity_aad_key = "cred_management"
    }
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

  "cred_alz" = {
    name                      = "es"
    resource_group_key        = "sp_credentials"
    sku_name                  = "standard"
    purge_protection_enabled  = true
    soft_delete_enabled       = true
    enable_rbac_authorization = true
    tags = {
      caf_environment      = "ph_environment"
      caf_identity_aad_key = "cred_alz"
    }
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

  "cred_connectivity" = {
    name                      = "co"
    resource_group_key        = "sp_credentials"
    sku_name                  = "standard"
    purge_protection_enabled  = true
    soft_delete_enabled       = true
    enable_rbac_authorization = true
    tags = {
      caf_environment      = "ph_environment"
      caf_identity_aad_key = "cred_connectivity"
    }
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

  "cred_subscription_creation_platform" = {
    name                      = "scp"
    resource_group_key        = "sp_credentials"
    sku_name                  = "standard"
    purge_protection_enabled  = true
    soft_delete_enabled       = true
    enable_rbac_authorization = true
    tags = {
      caf_environment      = "ph_environment"
      caf_identity_aad_key = "cred_subscription_creation_platform"
    }
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

  "cred_subscription_creation_landingzones" = {
    name                      = "scl"
    resource_group_key        = "sp_credentials"
    sku_name                  = "standard"
    purge_protection_enabled  = true
    soft_delete_enabled       = true
    enable_rbac_authorization = true
    tags = {
      caf_environment      = "ph_environment"
      caf_identity_aad_key = "cred_subscription_creation_landingzones"
    }
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

  "cred_gitops" = {
    name                      = "gitops"
    resource_group_key        = "sp_credentials"
    sku_name                  = "standard"
    purge_protection_enabled  = true
    soft_delete_enabled       = true
    enable_rbac_authorization = true
    tags = {
      caf_environment      = "ph_environment"
      caf_identity_aad_key = "cred_gitops"
    }
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
