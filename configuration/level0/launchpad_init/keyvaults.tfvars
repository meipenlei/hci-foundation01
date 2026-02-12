
keyvaults = {
  level0 = {
    name                      = "l0"
    resource_group_key        = "level0"
    sku_name                  = "standard"
    purge_protection_enabled  = false
    soft_delete_enabled       = false
    enable_rbac_authorization = true
    tags = {
      caf_tfstate     = "level0"
      caf_environment = "ph_environment"
    }
  }

  level1 = {
    name                      = "l1"
    resource_group_key        = "level1"
    sku_name                  = "standard"
    purge_protection_enabled  = false
    soft_delete_enabled       = false
    enable_rbac_authorization = true
    tags = {
      caf_tfstate     = "level1"
      caf_environment = "ph_environment"
    }
  }

  level2 = {
    name                      = "l2"
    resource_group_key        = "level2"
    sku_name                  = "standard"
    purge_protection_enabled  = false
    soft_delete_enabled       = false
    enable_rbac_authorization = true
    tags = {
      caf_tfstate     = "level2"
      caf_environment = "ph_environment"
    }
  }

  level3 = {
    name                      = "l3"
    resource_group_key        = "level3"
    sku_name                  = "standard"
    purge_protection_enabled  = false
    soft_delete_enabled       = false
    enable_rbac_authorization = true
    tags = {
      caf_tfstate     = "level3"
      caf_environment = "ph_environment"
    }
  }

  level4 = {
    name                      = "l4"
    resource_group_key        = "level4"
    sku_name                  = "standard"
    purge_protection_enabled  = false
    soft_delete_enabled       = false
    enable_rbac_authorization = true
    tags = {
      caf_tfstate     = "level4"
      caf_environment = "ph_environment"
    }
  }

  "cred_level0" = {
    name                      = "idl0"
    resource_group_key        = "sp_credentials"
    sku_name                  = "standard"
    purge_protection_enabled  = false
    soft_delete_enabled       = false
    enable_rbac_authorization = true
    tags = {
      caf_environment      = "ph_environment"
      caf_identity_aad_key = "cred_level0"
    }
  }

  "cred_identity" = {
    name                      = "id"
    resource_group_key        = "sp_credentials"
    sku_name                  = "standard"
    purge_protection_enabled  = false
    soft_delete_enabled       = false
    enable_rbac_authorization = true
    tags = {
      caf_environment      = "ph_environment"
      caf_identity_aad_key = "cred_identity"
    }
  }

  "cred_management" = {
    name                      = "mg"
    resource_group_key        = "sp_credentials"
    sku_name                  = "standard"
    purge_protection_enabled  = false
    soft_delete_enabled       = false
    enable_rbac_authorization = true
    tags = {
      caf_environment      = "ph_environment"
      caf_identity_aad_key = "cred_management"
    }
  }

  "cred_alz" = {
    name                      = "es"
    resource_group_key        = "sp_credentials"
    sku_name                  = "standard"
    purge_protection_enabled  = false
    soft_delete_enabled       = false
    enable_rbac_authorization = true
    tags = {
      caf_environment      = "ph_environment"
      caf_identity_aad_key = "cred_alz"
    }
  }

  "cred_connectivity" = {
    name                      = "co"
    resource_group_key        = "sp_credentials"
    sku_name                  = "standard"
    purge_protection_enabled  = false
    soft_delete_enabled       = false
    enable_rbac_authorization = true
    tags = {
      caf_environment      = "ph_environment"
      caf_identity_aad_key = "cred_connectivity"
    }
  }

  "cred_subscription_creation_platform" = {
    name                      = "scp"
    resource_group_key        = "sp_credentials"
    sku_name                  = "standard"
    purge_protection_enabled  = false
    soft_delete_enabled       = false
    enable_rbac_authorization = true
    tags = {
      caf_environment      = "ph_environment"
      caf_identity_aad_key = "cred_subscription_creation_platform"
    }
  }

  "cred_subscription_creation_landingzones" = {
    name                      = "scl"
    resource_group_key        = "sp_credentials"
    sku_name                  = "standard"
    purge_protection_enabled  = false
    soft_delete_enabled       = false
    enable_rbac_authorization = true
    tags = {
      caf_environment      = "ph_environment"
      caf_identity_aad_key = "cred_subscription_creation_landingzones"
    }
  }

  "cred_gitops" = {
    name                      = "gitops"
    resource_group_key        = "sp_credentials"
    sku_name                  = "standard"
    purge_protection_enabled  = false
    soft_delete_enabled       = false
    enable_rbac_authorization = true
    tags = {
      caf_environment      = "ph_environment"
      caf_identity_aad_key = "cred_gitops"
    }
  }
}
