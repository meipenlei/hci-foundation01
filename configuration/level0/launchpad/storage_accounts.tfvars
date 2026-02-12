storage_accounts = {
  level0 = {
    name                     = "l0"
    resource_group_key       = "level0"
    account_kind             = "BlobStorage"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    account_kind             = "StorageV2"
    blob_properties = {
      versioning_enabled       = true
      last_access_time_enabled = true
      container_delete_retention_policy = {
        days = 7
      }
      delete_retention_policy = {
        days = 7
      }
    }
    containers = {
      tfstate = {
        name = "tfstate"
      }
    }
    tags = {
      # Those tags must never be changed after being set as they are used by the rover to locate the launchpad and the tfstates.
      # Only adjust the environment value at creation time
      caf_environment = "ph_environment"
      caf_launchpad   = "launchpad"
      caf_tfstate     = "level0"
    }
    network = {
      bypass   = ["Logging", "Metrics", "AzureServices"] #optional. Valid options are any combination of Logging, Metrics, AzureServices, or None
      ip_rules = []                                      #optional. The prefix of ip_rules must be between 0 and 30 and only supports public IP addresses.
      subnets = {
        # subnet1 = {
        #   vnet_key   = "spoke1"
        #   subnet_key = "frontend"
        # }
        #add multiple subnets by extending this block. You can reference remote subnets by using remote_subnet_id
        subnet1 = {
          remote_subnet_id = "/subscriptions/ph_identity_subscription_id/resourceGroups/ph_prefix-rg-self-hosted-level0/providers/Microsoft.Network/virtualNetworks/ph_prefix-vnet-mdp/subnets/ph_prefix-snet-frontend"
        }
      }
    }
  }

  level1 = {
    name                     = "l1"
    resource_group_key       = "level1"
    account_kind             = "BlobStorage"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    account_kind             = "StorageV2"
    blob_properties = {
      versioning_enabled       = true
      last_access_time_enabled = true
      container_delete_retention_policy = {
        days = 7
      }
      delete_retention_policy = {
        days = 7
      }
    }
    containers = {
      tfstate = {
        name = "tfstate"
      }
    }
    tags = {
      # Those tags must never be changed after being set as they are used by the rover to locate the launchpad and the tfstates.
      # Only adjust the environment value at creation time
      caf_environment = "ph_environment"
      caf_launchpad   = "launchpad"
      caf_tfstate     = "level1"
    }
    network = {
      bypass   = ["Logging", "Metrics", "AzureServices"] #optional. Valid options are any combination of Logging, Metrics, AzureServices, or None
      ip_rules = []                                      #optional. The prefix of ip_rules must be between 0 and 30 and only supports public IP addresses.
      subnets = {
        # subnet1 = {
        #   vnet_key   = "spoke1"
        #   subnet_key = "frontend"
        # }
        #add multiple subnets by extending this block. You can reference remote subnets by using remote_subnet_id
        subnet1 = {
          remote_subnet_id = "/subscriptions/ph_identity_subscription_id/resourceGroups/ph_prefix-rg-self-hosted-level0/providers/Microsoft.Network/virtualNetworks/ph_prefix-vnet-mdp/subnets/ph_prefix-snet-frontend"
        }
      }
    }
  }

  level2 = {
    name                     = "l2"
    resource_group_key       = "level2"
    account_kind             = "BlobStorage"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    account_kind             = "StorageV2"
    blob_properties = {
      versioning_enabled       = true
      last_access_time_enabled = true
      container_delete_retention_policy = {
        days = 7
      }
      delete_retention_policy = {
        days = 7
      }
    }
    containers = {
      tfstate = {
        name = "tfstate"
      }
    }
    tags = {
      # Those tags must never be changed after being set as they are used by the rover to locate the launchpad and the tfstates.
      # Only adjust the environment value at creation time
      caf_environment = "ph_environment"
      caf_launchpad   = "launchpad"
      caf_tfstate     = "level2"
    }
    network = {
      bypass   = ["Logging", "Metrics", "AzureServices"] #optional. Valid options are any combination of Logging, Metrics, AzureServices, or None
      ip_rules = []                                      #optional. The prefix of ip_rules must be between 0 and 30 and only supports public IP addresses.
      subnets = {
        # subnet1 = {
        #   vnet_key   = "spoke1"
        #   subnet_key = "frontend"
        # }
        #add multiple subnets by extending this block. You can reference remote subnets by using remote_subnet_id
        subnet1 = {
          remote_subnet_id = "/subscriptions/ph_identity_subscription_id/resourceGroups/ph_prefix-rg-self-hosted-level0/providers/Microsoft.Network/virtualNetworks/ph_prefix-vnet-mdp/subnets/ph_prefix-snet-frontend"
        }
      }
    }
  }

  level3 = {
    name                     = "l3"
    resource_group_key       = "level3"
    account_kind             = "BlobStorage"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    account_kind             = "StorageV2"
    blob_properties = {
      versioning_enabled       = true
      last_access_time_enabled = true
      container_delete_retention_policy = {
        days = 7
      }
      delete_retention_policy = {
        days = 7
      }
    }
    containers = {
      tfstate = {
        name = "tfstate"
      }
    }
    tags = {
      # Those tags must never be changed after being set as they are used by the rover to locate the launchpad and the tfstates.
      # Only adjust the environment value at creation time
      caf_environment = "ph_environment"
      caf_launchpad   = "launchpad"
      caf_tfstate     = "level3"
    }
    network = {
      bypass   = ["Logging", "Metrics", "AzureServices"] #optional. Valid options are any combination of Logging, Metrics, AzureServices, or None
      ip_rules = []                                      #optional. The prefix of ip_rules must be between 0 and 30 and only supports public IP addresses.
      subnets = {
        # subnet1 = {
        #   vnet_key   = "spoke1"
        #   subnet_key = "frontend"
        # }
        #add multiple subnets by extending this block. You can reference remote subnets by using remote_subnet_id
        subnet1 = {
          remote_subnet_id = "/subscriptions/ph_identity_subscription_id/resourceGroups/ph_prefix-rg-self-hosted-level0/providers/Microsoft.Network/virtualNetworks/ph_prefix-vnet-mdp/subnets/ph_prefix-snet-frontend"
        }
      }
    }
  }

  level4 = {
    name                     = "l4"
    resource_group_key       = "level4"
    account_kind             = "BlobStorage"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    account_kind             = "StorageV2"
    blob_properties = {
      versioning_enabled       = true
      last_access_time_enabled = true
      container_delete_retention_policy = {
        days = 7
      }
      delete_retention_policy = {
        days = 7
      }
    }
    containers = {
      tfstate = {
        name = "tfstate"
      }
    }
    tags = {
      # Those tags must never be changed after being set as they are used by the rover to locate the launchpad and the tfstates.
      # Only adjust the environment value at creation time
      caf_environment = "ph_environment"
      caf_launchpad   = "launchpad"
      caf_tfstate     = "level4"
    }
    network = {
      bypass   = ["Logging", "Metrics", "AzureServices"] #optional. Valid options are any combination of Logging, Metrics, AzureServices, or None
      ip_rules = []                                      #optional. The prefix of ip_rules must be between 0 and 30 and only supports public IP addresses.
      subnets = {
        # subnet1 = {
        #   vnet_key   = "spoke1"
        #   subnet_key = "frontend"
        # }
        #add multiple subnets by extending this block. You can reference remote subnets by using remote_subnet_id
        subnet1 = {
          remote_subnet_id = "/subscriptions/ph_identity_subscription_id/resourceGroups/ph_prefix-rg-self-hosted-level0/providers/Microsoft.Network/virtualNetworks/ph_prefix-vnet-mdp/subnets/ph_prefix-snet-frontend"
        }
      }
    }
  }
}
