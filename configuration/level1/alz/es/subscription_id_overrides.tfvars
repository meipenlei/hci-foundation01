subscription_id_overrides = {
  root           = []
  decommissioned = []
  sandboxes      = []
  landing-zones  = []
  corp           = []
  online         = []
  platform       = []
  connectivity = [
    "ph_connectivity_subscription_id"
  ]
  management = [
    "ph_management_subscription_id"
  ]
  identity = [
    "ph_identity_subscription_id"
  ]
}

subscription_id_overrides_by_keys = {}
