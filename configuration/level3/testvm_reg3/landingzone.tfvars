landingzone = {
  backend_type        = "azurerm"
  level               = "level3"
  key                 = "testvm_reg3"
  global_settings_key = "connectivity_spoke3_reg3"
  tfstates = {
    connectivity_spoke3_reg3 = {
      tfstate   = "connectivity_spoke3_reg3.tfstate"
      workspace = "tfstate"
      level     = "lower"
    }
  }
}
