resource_groups = {
  management = {
    name   = "mgmt"
    region = "region1"
    tags = {
      solution_topic   = "ph_customer_topic"
      cost_center      = "ph_cost_center_level1"
      cost_responsible = "ph_cost_responsible_level1"
    }
  }
  nsgflogs1 = {
    name   = "nsgflogs1"
    region = "region1"
    tags = {
      solution_topic   = "ph_customer_topic"
      cost_center      = "ph_cost_center_level1"
      cost_responsible = "ph_cost_responsible_level1"
    }
  }
  nsgflogs2 = {
    name   = "nsgflogs2"
    region = "region2"
    tags = {
      solution_topic   = "ph_customer_topic"
      cost_center      = "ph_cost_center_level1"
      cost_responsible = "ph_cost_responsible_level1"
    }
  }

  alerts = {
    name   = "alerts"
    region = "region1"
    tags = {
      solution_topic   = "ph_customer_topic"
      cost_center      = "ph_cost_center_level1"
      cost_responsible = "ph_cost_responsible_level1"
    }
  }
}
