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
var_folder_path = "/tf/caf/configuration/level0/agent/runner_init"
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
