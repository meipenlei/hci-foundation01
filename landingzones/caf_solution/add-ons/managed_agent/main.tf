###############################################################################
# Provider & Auth
###############################################################################

terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = ">= 1.0.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=1.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = ">=2.0"
    }
  }
}


provider "azurerm" { # Azure RM
  features {}
  subscription_id = var.subscription_id
}

provider "azuredevops" {
  org_service_url       = var.azure_devops.url
  personal_access_token = try(var.azure_devops.personal_access_token, null)
  use_msi               = try(var.azure_devops.use_msi, false)
}

provider "azapi" {
  skip_provider_registration = true
}

data "azurerm_client_config" "current" {}

