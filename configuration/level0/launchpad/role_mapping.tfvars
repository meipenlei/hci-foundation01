role_mapping = {
  built_in_role_mapping = {
    management_group = {
      ph_optional_root_parent_id = {
        "User Access Administrator" = {
          azuread_groups = {
            keys = []
          }
        }
        "Management Group Contributor" = {
          azuread_groups = {
            keys = []
          }
        }
        "Owner" = {
          azuread_groups = {
            keys = ["alz", "level0", "caf_platform_maintainers"]
          }
        }
        "Contributor" = {
          azuread_groups = {
            keys = ["caf_platform_contributors"]
          }
        }
        "Reader" = {
          azuread_groups = {
            keys = ["caf_platform_readers"]
          }
        }
      }
    }

    subscriptions = {
      logged_in_subscription = {
        "Owner" = {
          azuread_groups = {
            keys = []
          }
          managed_identities = {
            keys = []
          }
        }
        "Contributor" = {
          azuread_groups = {
            keys = []
          }
        }
        "Reader" = {
          azuread_groups = {
            keys = []
          }
        }
      }
    }

    resource_groups = {
      level0 = {
        "Reader" = {
          azuread_groups = {
            keys = ["identity"]
          }
          managed_identities = {
            keys = ["level0"]
          }
        }
      }
      level1 = {
        "Reader" = {
          azuread_groups = {
            keys = []
          }
        }
      }
      level2 = {
        "Reader" = {
          azuread_groups = {
            keys = ["subscription_creation_platform"]
          }
        }
      }
      level3 = {
        "Reader" = {
          azuread_groups = {
            keys = ["subscription_creation_platform", "subscription_creation_landingzones"]
          }
        }
      }
      level4 = {
        "Reader" = {
          azuread_groups = {
            keys = ["subscription_creation_landingzones"]
          }
        }
      }
      sp_credentials = {
        "Key Vault Administrator" = {
          azuread_groups = {
            keys = ["level0", "caf_platform_maintainers"]
          }
        }
      }
    }

    storage_accounts = {
      level0 = {
        "Storage Blob Data Contributor" = {
          azuread_groups = {
            keys = ["level0", "caf_platform_maintainers"]
          }
          managed_identities = {
            keys = ["level0"]
          }
        }
        "Storage Blob Data Reader" = {
          azuread_groups = {
            keys = ["connectivity", "management", "identity", "alz"]
          }
        }
      }
      level1 = {
        "Storage Blob Data Contributor" = {
          azuread_groups = {
            keys = ["caf_platform_maintainers", "connectivity", "identity", "management", "alz", "level0"]
          }
          managed_identities = {
            keys = ["level0"]
          }
        }
        "Storage Blob Data Reader" = {
          azuread_groups = {
            keys = []
          }
        }
      }
      level2 = {
        "Storage Blob Data Contributor" = {
          azuread_groups = {
            keys = ["identity", "connectivity", "management", "caf_platform_maintainers", "level0"]
          }
          managed_identities = {
            keys = ["level0"]
          }
        }
        "Storage Blob Data Reader" = {
          azuread_groups = {
            keys = ["subscription_creation_platform"]
          }
        }
      }
      level3 = {
        "Storage Blob Data Contributor" = {
          azuread_groups = {
            keys = ["caf_platform_maintainers", "level0", "subscription_creation_platform"]
          }
          managed_identities = {
            keys = ["level0"]
          }
        }
        "Storage Blob Data Reader" = {
          azuread_groups = {
            keys = ["subscription_creation_landingzones"]
          }
        }
      }
      level4 = {
        "Storage Blob Data Contributor" = {
          azuread_groups = {
            keys = ["caf_platform_maintainers", "level0", "subscription_creation_landingzones"]
          }
          managed_identities = {
            keys = ["level0"]
          }
        }
        "Storage Blob Data Reader" = {
          azuread_groups = {
            keys = []
          }
        }
      }
    }

    keyvaults = {
      level0 = {
        "Key Vault Administrator" = {
          azuread_groups = {
            keys = ["level0", "caf_platform_maintainers"]
          }
        }
        "Key Vault Secrets User" = {
          managed_identities = {
            keys = ["level0"]
          }
          azuread_groups = {
            keys = []
          }
        }
      }
      level1 = {
        "Key Vault Administrator" = {
          azuread_groups = {
            keys = ["identity", "management", "alz", "caf_platform_maintainers"]
          }
        }
        "Key Vault Secrets User" = {
          managed_identities = {
            keys = ["level0"]
          }
          azuread_groups = {
            keys = []
          }
        }
      }
      level2 = {
        "Key Vault Administrator" = {
          azuread_groups = {
            keys = ["identity", "connectivity", "caf_platform_maintainers"]
          }
        }
        "Key Vault Secrets User" = {
          managed_identities = {
            keys = ["level0"]
          }
          azuread_groups = {
            keys = []
          }
        }
      }
      level3 = {
        "Key Vault Administrator" = {
          azuread_groups = {
            keys = ["subscription_creation_platform", "caf_platform_maintainers"]
          }
        }
        "Key Vault Secrets User" = {
          azuread_groups = {
            keys = ["subscription_creation_platform"]
          }
          managed_identities = {
            keys = ["level0"]
          }
        }
      }
      level4 = {
        "Key Vault Administrator" = {
          azuread_groups = {
            keys = ["subscription_creation_landingzones", "caf_platform_maintainers"]
          }
        }
        "Key Vault Secrets User" = {
          managed_identities = {
            keys = ["level0"]
          }
          azuread_groups = {
            keys = []
          }
        }
      }
      cred_level0 = {
        "Key Vault Administrator" = {
          azuread_groups = {
            keys = ["level0", "caf_platform_maintainers"]
          }
        }
        "Key Vault Secrets User" = {
          managed_identities = {
            keys = ["level0"]
          }
          azuread_groups = {
            keys = ["gitops"]
          }
        }
      }
      cred_identity = {
        "Key Vault Administrator" = {
          azuread_groups = {
            keys = ["identity", "caf_platform_maintainers"]
          }
        }
        "Key Vault Secrets User" = {
          managed_identities = {
            keys = ["level0"]
          }
          azuread_groups = {
            keys = ["gitops"]
          }
        }
      }
      cred_management = {
        "Key Vault Administrator" = {
          azuread_groups = {
            keys = ["management", "caf_platform_maintainers"]
          }
        }
        "Key Vault Secrets User" = {
          managed_identities = {
            keys = ["level0"]
          }
          azuread_groups = {
            keys = ["gitops"]
          }
        }
      }
      cred_alz = {
        "Key Vault Administrator" = {
          azuread_groups = {
            keys = ["alz", "caf_platform_maintainers"]
          }
        }
        "Key Vault Secrets User" = {
          managed_identities = {
            keys = ["level0"]
          }
          azuread_groups = {
            keys = ["gitops"]
          }
        }
      }
      cred_connectivity = {
        "Key Vault Administrator" = {
          azuread_groups = {
            keys = ["connectivity", "caf_platform_maintainers"]
          }
        }
        "Key Vault Secrets User" = {
          managed_identities = {
            keys = ["level0"]
          }
          azuread_groups = {
            keys = ["gitops"]
          }
        }
      }
      cred_subscription_creation_platform = {
        "Key Vault Administrator" = {
          azuread_groups = {
            keys = ["subscription_creation_platform", "caf_platform_maintainers"]
          }
        }
        "Key Vault Secrets User" = {
          managed_identities = {
            keys = ["level0"]
          }
          azuread_groups = {
            keys = ["gitops"]
          }
        }
      }
      cred_subscription_creation_landingzones = {
        "Key Vault Administrator" = {
          azuread_groups = {
            keys = ["subscription_creation_landingzones", "caf_platform_maintainers"]
          }
        }
        "Key Vault Secrets User" = {
          managed_identities = {
            keys = ["level0"]
          }
          azuread_groups = {
            keys = ["gitops"]
          }
        }
      }
      cred_gitops = {
        "Key Vault Administrator" = {
          azuread_groups = {
            keys = ["gitops", "caf_platform_maintainers"]
          }
        }
        "Key Vault Secrets User" = {
          managed_identities = {
            keys = ["level0"]
          }
          azuread_groups = {
            keys = ["gitops"]
          }
        }
      }
    }
  }
}
