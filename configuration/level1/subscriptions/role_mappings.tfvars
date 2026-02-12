role_mapping = {
  built_in_role_mapping = {
    subscriptions = {
      identity = {
        "Owner" = {
          azuread_groups = {
            lz_key = "launchpad"
            keys   = ["identity"]
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
      connectivity = {
        "Owner" = {
          azuread_groups = {
            lz_key = "launchpad"
            keys   = ["connectivity"]
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
      management = {
        "Owner" = {
          azuread_groups = {
            lz_key = "launchpad"
            keys   = ["management"]
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
      application001 = {
        "Owner" = {
          azuread_groups = {
            lz_key = "launchpad"
            keys   = ["subscription_creation_platform"]
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
  }
}