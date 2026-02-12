role_mapping = {
  built_in_role_mapping = {
    resource_groups = {
      rg1 = {
        "Key Vault Administrator" = {
          # Using raw object IDs (GUIDs of groups / service principals / managed identities)
          object_ids = {
            keys = [
              "11111111-1111-1111-1111-111111111111", # replace with object_id of cefi1-level0 group
              "22222222-2222-2222-2222-222222222222"  # replace with object_id of cefi1-platform_maintainers group
            ]
          }
        }
      }
    }
    keyvaults = {
      kv1 = {
        "Key Vault Secrets User" = {
          object_ids = {
            keys = [
              "33333333-3333-3333-3333-333333333333" # replace with object_id of cefi1-msi-level0 managed identity
            ]
          }
        }
        "Key Vault Administrator" = {
          object_ids = {
            keys = [
              "11111111-1111-1111-1111-111111111111", # replace with object_id of cefi1-level0 group
              "22222222-2222-2222-2222-222222222222"  # replace with object_id of cefi1-platform_maintainers group
            ]
          }
          logged_in = {
            keys = ["user"]
          }
        }
      }
    }
  }
}