
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
        object_id          = "6455e5c3-d602-41cd-84a3-e903e45fa536"
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }
  }
}