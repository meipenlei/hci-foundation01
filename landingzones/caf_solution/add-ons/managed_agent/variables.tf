variable "resource_group_name" {
  description = "The name of the resource group where the Managed DevOps Pool will be created."
  type        = string
  default     = null
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "The subnet ID where the Managed DevOps Pool will be created."
  type        = string
  default     = null
}

variable "vnet_name" {
  description = "The name of the virtual network where the Managed DevOps Pool will be created."
  type        = string
  default     = null
}

variable "ado_org" {
  description = "The Azure DevOps organization name."
  type        = string
  default     = null
}

variable "ado_project" {
  description = "The Azure DevOps project name."
  type        = string
  default     = null
}

variable "ado_project_id" {
  description = "The Azure DevOps project ID."
  type        = string
  default     = null
}

variable "max_agents" {
  description = "The maximum number of agents in the Azure DevOps pool."
  type        = number
  default     = 1
}

variable "user_assigned_identity_resource_id" {
  description = "The reference to the user-assigned managed identity (object with lz_key and managed_identity_keys)."
  type = object({
    lz_key                = string
    managed_identity_keys = list(string)
  })
  default = null
}

variable "base_tags" {
  description = "Base tags to be applied to all resources."
  type        = map(string)
  default     = {}
}

variable "global_settings" {
  description = "Global settings object (see module README.md)"
  type        = any
  default     = {}
}

variable "client_id" {
  description = "Client ID for Azure authentication."
  type        = string
  default     = null
}

variable "remote_objects" {
  description = "Remote objects configuration."
  type        = any
  default     = {}
}

variable "resource_group" {
  description = "Resource group object (see module README.md)."
  type        = any
  default     = {}
}

variable "settings" {
  description = "Settings object (see module README.md)."
  type        = any
  default     = {}
}

variable "devcenter_name" {
  description = "The name of the Dev Center."
  type        = string
  default     = "devcenter-ado"
}

variable "devcenter_project_name" {
  description = "The name of the Dev Center project."
  type        = string
  default     = "ado-project"
}

variable "agent_name" {
  description = "The name of the agent to be created in the Azure DevOps pool."
  type        = string
  default     = "managed-agent"
}

variable "managed_agent" {
  description = "Configuration object - Managed Agents resources"
  type        = any
  default     = {}
}

variable "subscription_id" {
  description = "The Azure subscription ID where resources will be created."
  type        = string
  default     = null
}

variable "resource_groups" {
  description = "Configuration object - Resource groups."
  default     = {}
}

variable "data_sources" {
  description = "Data gathering for resources not managed by CAF Module"
  default     = {}
}

variable "tenant_id" {}

variable "environment" {
  description = "Name of the CAF environment."
  type        = string
  default     = "sandpit"
}

# Map of the remote data state for lower level
variable "lower_storage_account_name" {}
variable "lower_container_name" {}
variable "lower_resource_group_name" {}

variable "tfstate_storage_account_name" {}
variable "tfstate_container_name" {}
variable "tfstate_key" {}
variable "tfstate_resource_group_name" {}

variable "tfstate_subscription_id" {
  description = "This value is propulated by the rover. subscription id hosting the remote tfstates"
}

variable "current_landingzone_key" {
  description = "Key for the current landing zones where the deployment is executed. Used in the context of landing zone deployment."
  default     = "local"
  type        = string
}

variable "logged_user_objectId" {
  description = "Used to set access policies based on the value 'logged_in_user'. Can only be used in interactive execution with vscode."
  type        = string
  default     = null
}

variable "logged_aad_app_objectId" {
  description = "Used to set access policies based on the value 'logged_in_aad_app'"
  type        = string
  default     = null
}

variable "azurerm_route_tables" {
  description = "Route tables to be created in the Azure environment."
  type        = map(any)
  default     = {}
}

variable "azure_devops" {
  description = "Azure DevOps configuration object."
  type = object({
    url                   = string
    personal_access_token = string
    use_msi               = bool
  })
  default = {
    url                   = "https://dev.azure.com/https://dev.azure.com/CopDev/"
    personal_access_token = ""
    use_msi               = false
  }

}

variable "role_mapping" {
  description = "Mapping of Azure DevOps roles to Azure AD roles."
  type        = any
  default     = {}
}

variable "global_settings_override" {
  default = {}
}

variable "landingzone" {
  default = {
    azurerm = {
      backend_type        = "azurerm"
      global_settings_key = "launchpad"
      level               = "level1"
      key                 = "caf_examples"
      tfstates = {
        launchpad = {
          level   = "lower"
          tfstate = "caf_launchpad.tfstate"
        }
      }
    }
    remote = {
      backend_type        = "remote"
      global_settings_key = "launchpad"
      level               = "level1"
      key                 = "caf_examples"
      tfstates = {
        launchpad = {
          tfstate = "caf_launchpad.tfstate"
        }
      }
    }
  }
}

variable "backend_type" {
  default     = "azurerm"
  description = "Set the terraform remote backend provider."
  validation {
    condition     = contains(["azurerm", "remote"], var.backend_type)
    error_message = "Only azurerm or remote are supported at that time."
  }
}