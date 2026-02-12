# variable "managed_agent" {
#   description = "A map of managed agent configurations, where the key is the agent name and the value is a map of agent properties."
#   type = map(object({
#     resource_group_key     = string
#     agent_name             = string
#     devcenter_name         = string
#     devcenter_project_name = string
#     client_id              = string
#     ado_org                = string
#     ado_project            = string
#     max_agents             = number
#     identity = object({
#       lz_key                = string
#       managed_identity_keys = list(string)
#     })
#   }))
#   default = {}
# }

variable "ado_org_url" {
  description = "Azure DevOps organization URL"
  type        = string
  default     = "" # Default value can be overridden in the tfvars file
}

variable "azure_devops_personal_access_token" {
  description = "Azure DevOps PAT"
  type        = string
  sensitive   = true
  default     = "" # Set to an empty string by default, can be overridden in the tfvars file
}

variable "azuredevops_use_msi" {
  description = "Use managed identity for Azure DevOps provider"
  type        = bool
  default     = false
}