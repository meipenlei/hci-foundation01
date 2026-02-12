landingzone = {
  backend_type        = "azurerm"
  level               = "level2"
  key                 = "dc2_reg2"
  global_settings_key = "connectivity_spoke2_reg2"
  tfstates = {
    connectivity_spoke2_reg2 = {
      tfstate   = "connectivity_spoke2_reg2.tfstate"
      workspace = "tfstate"
      level     = "current"
    }
  }
}
