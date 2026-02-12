role_mapping = {
  built_in_role_mapping = {
    resource_groups = {
      rg1 = {
        "Key Vault Administrator" = {
          azuread_groups = {
            lz_key = "launchpad" # to be defined when the group is created in a different lz
            keys   = ["level0", "caf_platform_maintainers"]
          }
        }
      }
    }
    keyvaults = {
      ssh = {
        "Key Vault Secrets User" = {
          managed_identities = {
            lz_key = "launchpad" # to be defined when the msi is created in a different lz
            keys   = ["level0"]
          }
        }
        "Key Vault Administrator" = {
          azuread_groups = {
            lz_key = "launchpad" # to be defined when the group is created in a different lz
            keys   = ["level0", "caf_platform_maintainers"]
          }
        }
      }
    }
    storage_accounts = {
      sa1 = {
        "Storage Blob Data Contributor" = {
          azuread_groups = {
            lz_key = "launchpad"
            keys   = ["level0", "caf_platform_maintainers"]
          }
          managed_identities = {
            lz_key = "launchpad"
            keys   = ["level0"]
          }
        }
      }
    }
    networking = {
      spoke1 = { # or whatever your VNet key is
        "Reader" = {
          azuread_service_principals = {
            lz_key = "launchpad"
            keys   = ["subscription_creation_platform", "subscription_creation_landingzones"]
          }
        }
      }
    }
  }
}
