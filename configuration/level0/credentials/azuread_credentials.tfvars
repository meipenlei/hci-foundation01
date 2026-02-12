azuread_credentials = {
  gitops = {
    type                          = "password"
    azuread_credential_policy_key = "gitops"

    azuread_application = {
      lz_key = "launchpad"
      key    = "gitops"
    }
    keyvaults = {
      lz_key = "launchpad"
      cred_gitops = {
        secret_prefix = "sp"
      }
    }
  }
  level0 = {
    type                          = "password"
    azuread_credential_policy_key = "default_policy"

    azuread_application = {
      lz_key = "launchpad"
      key    = "level0"
    }
    keyvaults = {
      lz_key = "launchpad"
      cred_level0 = {
        secret_prefix = "sp"
      }
    }
  }
  identity = {
    type                          = "password"
    azuread_credential_policy_key = "default_policy"

    azuread_application = {
      lz_key = "launchpad"
      key    = "identity"
    }
    keyvaults = {
      lz_key = "launchpad"
      cred_identity = {
        secret_prefix = "sp"
      }
    }
  }
  management = {
    type                          = "password"
    azuread_credential_policy_key = "default_policy"

    azuread_application = {
      lz_key = "launchpad"
      key    = "management"
    }
    keyvaults = {
      lz_key = "launchpad"
      cred_management = {
        secret_prefix = "sp"
      }
    }
  }
  alz = {
    type                          = "password"
    azuread_credential_policy_key = "default_policy"

    azuread_application = {
      lz_key = "launchpad"
      key    = "alz"
    }
    keyvaults = {
      lz_key = "launchpad"
      cred_alz = {
        secret_prefix = "sp"
      }
    }
  }
  connectivity = {
    type                          = "password"
    azuread_credential_policy_key = "default_policy"

    azuread_application = {
      lz_key = "launchpad"
      key    = "connectivity"
    }
    keyvaults = {
      lz_key = "launchpad"
      cred_connectivity = {
        secret_prefix = "sp"
      }
    }
  }
  subscription_creation_platform = {
    type                          = "password"
    azuread_credential_policy_key = "default_policy"

    azuread_application = {
      lz_key = "launchpad"
      key    = "subscription_creation_platform"
    }
    keyvaults = {
      lz_key = "launchpad"
      cred_subscription_creation_platform = {
        secret_prefix = "sp"
      }
    }
  }
  subscription_creation_landingzones = {
    type                          = "password"
    azuread_credential_policy_key = "default_policy"

    azuread_application = {
      lz_key = "launchpad"
      key    = "subscription_creation_landingzones"
    }
    keyvaults = {
      lz_key = "launchpad"
      cred_subscription_creation_landingzones = {
        secret_prefix = "sp"
      }
    }
  }
}