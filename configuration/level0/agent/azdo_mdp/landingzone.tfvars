landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "launchpad"
  level               = "level0"
  key                 = "agent-level0"
  tfstates = {
    launchpad = {
      level   = "current"
      tfstate = "caf_launchpad.tfstate"
    }
  }
}
