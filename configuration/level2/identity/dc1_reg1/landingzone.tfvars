landingzone = {
  backend_type        = "azurerm"
  level               = "level2"
  key                 = "dc1_reg1"
  global_settings_key = "connectivity_spoke1_reg1"
  tfstates = {
    connectivity_spoke1_reg1 = {
      tfstate   = "connectivity_spoke1_reg1.tfstate"
      workspace = "tfstate"
      level     = "current"
    }
  }
}
