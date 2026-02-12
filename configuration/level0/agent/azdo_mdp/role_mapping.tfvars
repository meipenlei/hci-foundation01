role_mapping = {
  built_in_role_mapping = {
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
