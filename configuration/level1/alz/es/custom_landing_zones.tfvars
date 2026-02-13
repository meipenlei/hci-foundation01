custom_landing_zones = {
  "hci01-security" = {
    display_name               = "Security"
    parent_management_group_id = "hci01-platform"
    archetype_config = {
      archetype_id   = "security"
      parameters     = {}
      access_control = {}
    }
    subscriptions    = {}
    subscription_ids = []
  }
  "hci01-public" = {
    display_name               = "Public"
    parent_management_group_id = "hci01-landing-zones"
    archetype_config = {
      archetype_id   = "public"
      parameters     = {}
      access_control = {}
    }
    subscriptions    = {}
    subscription_ids = []
  }
  "hci01-confidential-corp" = {
    display_name               = "Confidential Corp"
    parent_management_group_id = "hci01-landing-zones"
    archetype_config = {
      archetype_id   = "confidential-corp"
      parameters     = {}
      access_control = {}
    }
    subscriptions    = {}
    subscription_ids = []
  }
  "hci01-confidential-online" = {
    display_name               = "Confidential Online"
    parent_management_group_id = "hci01-landing-zones"
    archetype_config = {
      archetype_id   = "confidential-online"
      parameters     = {}
      access_control = {}
    }
    subscriptions    = {}
    subscription_ids = []
  }
}
