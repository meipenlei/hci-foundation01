landingzone = {
  backend_type = "azurerm"
  level        = "level2"
  key          = "connectivity_hub_reg3"
  tfstates = {
    management = {
      tfstate   = "management.tfstate"
      workspace = "tfstate"
      level     = "lower"
    }
  }
}
