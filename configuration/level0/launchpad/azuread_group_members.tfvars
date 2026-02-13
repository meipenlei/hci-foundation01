azuread_groups_membership = {
  caf_platform_maintainers = {
    members = {
      user_principal_names = [
        "mjacob@dacoplab.onmicrosoft.com"
      ],
      object_ids = [
        "6455e5c3-d602-41cd-84a3-e903e45fa536"
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
