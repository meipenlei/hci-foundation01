landingzone = {
  backend_type        = "azurerm"
  level               = "level1"
  key                 = "alz_es"
  global_settings_key = "launchpad"
  tfstates = {
    launchpad = {
      tfstate   = "caf_launchpad.tfstate"
      workspace = "tfstate"
      level     = "lower"
    }
    identity = {
      tfstate   = "identity.tfstate"
      workspace = "tfstate"
      level     = "current"
    }
    management = {
      tfstate   = "management.tfstate"
      workspace = "tfstate"
      level     = "current"
    }
    subscriptions = {
      tfstate   = "subscriptions.tfstate"
      workspace = "tfstate"
      level     = "current"
    }
  }
}
