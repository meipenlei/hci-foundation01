
resource_groups = {
  rg1 = {
    name   = "spoke2"
    region = "region2"
    tags = {
      solution_topic   = "connectivity"
      cost_center      = "SharedServices"
      cost_responsible = "admin@cloudenabler.onmicrosoft.com"
    }
  }
}
