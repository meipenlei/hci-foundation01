custom_landing_zones = {
  "ph_prefix-custom" = {
    display_name               = "Custom"
    parent_management_group_id = "ph_prefix-landing-zones"
    archetype_config = {
      archetype_id   = "custom"
      parameters     = {}
      access_control = {}
    }
    subscriptions = {}
    subscription_ids = [
      "ph_app001_subscription_id"
    ]
  }
}
