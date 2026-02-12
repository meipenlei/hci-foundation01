
managed_identities = {
  level0 = {
    # Used by the release agent to access the level's keyvaults and storage accounts with the tfstates in read / write
    name               = "level0"
    resource_group_key = "level0"
  }
  level1 = {
    # Used to monitor and track all resources
    name               = "mon"
    resource_group_key = "level1"
  }
}
