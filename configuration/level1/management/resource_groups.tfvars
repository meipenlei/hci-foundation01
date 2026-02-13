resource_groups = {
  management = {
    name   = "mgmt"
    region = "region1"
    tags = {
      solution_topic   = "hci01"
      cost_center      = "Governance"
      cost_responsible = "mjacob@cloudenabler.onmicrosoft.com"
    }
  }
  nsgflogs1 = {
    name   = "nsgflogs1"
    region = "region1"
    tags = {
      solution_topic   = "hci01"
      cost_center      = "Governance"
      cost_responsible = "mjacob@cloudenabler.onmicrosoft.com"
    }
  }
  nsgflogs2 = {
    name   = "nsgflogs2"
    region = "region2"
    tags = {
      solution_topic   = "hci01"
      cost_center      = "Governance"
      cost_responsible = "mjacob@cloudenabler.onmicrosoft.com"
    }
  }

  alerts = {
    name   = "alerts"
    region = "region1"
    tags = {
      solution_topic   = "hci01"
      cost_center      = "Governance"
      cost_responsible = "mjacob@cloudenabler.onmicrosoft.com"
    }
  }
}
