custom_landing_zones = {
  "hci01-custom" = {
    display_name               = "Custom"
    parent_management_group_id = "hci01-landing-zones"
    archetype_config = {
      archetype_id   = "custom"
      parameters     = {}
      access_control = {}
    }
    subscriptions = {}
    subscription_ids = [
      "f371e124-4b06-46ea-9d63-f51d48d76e64"
    ]
  }
}
