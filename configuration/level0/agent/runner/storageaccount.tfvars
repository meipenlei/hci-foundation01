storage_accounts = {
  sa1 = {
    name = "gh"
    resource_group = {
      #lz_key = "launchpad"
      key = "rg1"
    }
    # Account types are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Defaults to StorageV2
    account_kind = "BlobStorage"
    # Account Tier options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid.
    account_tier = "Standard"
    #  Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS
    account_replication_type = "LRS" # https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy
    network = {
      bypass   = ["Logging", "Metrics", "AzureServices"] #optional. Valid options are any combination of Logging, Metrics, AzureServices, or None
      ip_rules = []                                      #optional. The prefix of ip_rules must be between 0 and 30 and only supports public IP addresses.
      subnets = {
        subnet1 = {
          #lz_key     = "launchpad"
          vnet_key   = "spoke1"
          subnet_key = "frontend"
        }
        #add multiple subnets by extending this block. You can reference remote subnets by using remote_subnet_id
        #subnet2 = {
        #remote_subnet_id = "/subscriptions/*******/resourceGroups/*******/providers/Microsoft.Network/virtualNetworks/vnet-some-remote-vnet/subnets/snet-remote-subnet"
      }
    }
  }
}

storage_containers = {
  scripts = {
    name = "scripts"
    storage_account = {
      key = "sa1"
    }
    container_access_type = "private"
  }
}

# # Upload install-runner scripts
var_folder_path = "/tf/caf/configuration/level0/agent/runner"
storage_account_blobs = {
  script1 = {
    storage_account_key = "sa1"
    storage_container = {
      key = "scripts"
    }
    name   = "install-runner.sh"
    source = "scripts/install-runner.sh"
  }
}
