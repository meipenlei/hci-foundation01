output "devcenter_id" {
  description = "The resource ID of the created Dev Center."
  value       = azapi_resource.devcenter.id
}

output "devcenter_project_id" {
  description = "The resource ID of the created Dev Center Project."
  value       = azapi_resource.devcenter_project.id
}

output "devops_pool_names" {
  description = "The names of the Managed DevOps Pools."
  value       = { for k, m in module.mdp : k => m.name }
}

output "devops_agent_queue_ids" {
  description = "IDs of all created Azure DevOps agent queues"
  value       = { for k, v in azuredevops_agent_queue.queue : k => v.id }
}

output "pipeline_authorization_ids" {
  description = "IDs of all pipeline authorizations"
  value       = { for k, v in azuredevops_pipeline_authorization.allow_bootstrap : k => v.id }
}

output "debug_ids" {
  value = {
    subnet_id                          = var.subnet_id
    dev_center_project_resource_id     = azapi_resource.devcenter_project.id
    user_assigned_identity_resource_id = var.user_assigned_identity_resource_id
  }
}

