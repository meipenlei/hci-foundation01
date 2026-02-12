dynamic_keyvault_secrets = {
  level0 = {
    msi = {
      output_key    = "managed_identities"
      resource_key  = "level0"
      attribute_key = "id"
      secret_name   = "msi-resource-id"
    }
    subscription_id = {
      output_key    = "client_config"
      attribute_key = "subscription_id"
      secret_name   = "subscription-id"
    }
    tenant_id = {
      output_key    = "client_config"
      attribute_key = "tenant_id"
      secret_name   = "tenant-id"
    }
  }
  level1 = {
    lower_stg = {
      output_key    = "storage_accounts"
      resource_key  = "level0"
      attribute_key = "name"
      secret_name   = "lower-storage-account-name"
    }
    lower_rg = {
      output_key    = "resource_groups"
      resource_key  = "level0"
      attribute_key = "name"
      secret_name   = "lower-resource-group-name"
    }
    subscription_id = {
      output_key    = "client_config"
      attribute_key = "subscription_id"
      secret_name   = "subscription-id"
    }
    tenant_id = {
      output_key    = "client_config"
      attribute_key = "tenant_id"
      secret_name   = "tenant-id"
    }
  }
  level2 = {
    lower_stg = {
      output_key    = "storage_accounts"
      resource_key  = "level1"
      attribute_key = "name"
      secret_name   = "lower-storage-account-name"
    }
    lower_rg = {
      output_key    = "resource_groups"
      resource_key  = "level1"
      attribute_key = "name"
      secret_name   = "lower-resource-group-name"
    }
    subscription_id = {
      output_key    = "client_config"
      attribute_key = "subscription_id"
      secret_name   = "subscription-id"
    }
    tenant_id = {
      output_key    = "client_config"
      attribute_key = "tenant_id"
      secret_name   = "tenant-id"
    }
  }
  level3 = {
    lower_stg = {
      output_key    = "storage_accounts"
      resource_key  = "level2"
      attribute_key = "name"
      secret_name   = "lower-storage-account-name"
    }
    lower_rg = {
      output_key    = "resource_groups"
      resource_key  = "level2"
      attribute_key = "name"
      secret_name   = "lower-resource-group-name"
    }
    subscription_id = {
      output_key    = "client_config"
      attribute_key = "subscription_id"
      secret_name   = "subscription-id"
    }
    tenant_id = {
      output_key    = "client_config"
      attribute_key = "tenant_id"
      secret_name   = "tenant-id"
    }
  }
  level4 = {
    lower_stg = {
      output_key    = "storage_accounts"
      resource_key  = "level3"
      attribute_key = "name"
      secret_name   = "lower-storage-account-name"
    }
    lower_rg = {
      output_key    = "resource_groups"
      resource_key  = "level3"
      attribute_key = "name"
      secret_name   = "lower-resource-group-name"
    }
    subscription_id = {
      output_key    = "client_config"
      attribute_key = "subscription_id"
      secret_name   = "subscription-id"
    }
    tenant_id = {
      output_key    = "client_config"
      attribute_key = "tenant_id"
      secret_name   = "tenant-id"
    }
  }
}
