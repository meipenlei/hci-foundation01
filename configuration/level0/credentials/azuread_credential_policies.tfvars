azuread_credential_policies = {
  gitops = {
    # Length of the password
    length  = 250
    special = false
    upper   = true
    number  = true

    # Password Expiration date
    expire_in_days = 180
    rotation_key0 = {
      # Odd number
      days = 81
    }
    rotation_key1 = {
      # Even number
      days = 160
    }
  }
  default_policy = {
    # Length of the password
    length  = 250
    special = false
    upper   = true
    number  = true

    # Password Expiration date
    expire_in_days = 360
    rotation_key0 = {
      # Odd number
      days = 181
    }
    rotation_key1 = {
      # Even number
      days = 300
    }
  }

}
