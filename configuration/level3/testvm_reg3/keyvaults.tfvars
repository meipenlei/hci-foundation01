
keyvaults = {
  kv1 = {
    name                = "testvm"
    resource_group_key  = "rg1"
    sku_name            = "standard"
    soft_delete_enabled = false
    creation_policies = {
      logged_in_user = {
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
      caf_platform_maintainers = {
        object_id          = "ph_bootstrapper_object_id"
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }
  }
}