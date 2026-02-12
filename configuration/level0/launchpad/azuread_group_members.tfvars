azuread_groups_membership = {
  caf_platform_maintainers = {
    members = {
      user_principal_names = [
        "ph_bootstrap_user_e-mail"
      ],
      object_ids = [
        "ph_bootstrapper_object_id"
      ]
    }
    azuread_service_principals = {
      members = {
        keys = ["level0"]
      }
    }
  }
  caf_platform_contributors = {
    azuread_service_principals = {
      members = {
        keys = ["identity", "connectivity", "management"]
      }
    }
  }
  caf_platform_readers = {
    azuread_service_principals = {
      members = {
        keys = []
      }
    }
  }
}
