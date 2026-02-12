landingzone = {
  backend_type        = "azurerm"
  level               = "level2"
  key                 = "connectivity_spoke1_reg1"
  global_settings_key = "connectivity_hub_reg3"
  tfstates = {
    connectivity_hub_reg3 = {
      tfstate   = "connectivity_hub_reg3.tfstate"
      workspace = "tfstate"
      level     = "current"
    }
  }
}
