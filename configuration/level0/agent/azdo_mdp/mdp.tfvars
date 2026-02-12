managed_agent = {
  agent1 = {
    resource_group_key      = "rg1"
    vnet_key                = "spoke1"
    name                    = "hci01-level0-agent1"
    devcenter_name          = "ado-devcenter"
    devcenter_project_name  = "ado-project"
    ado_org                 = "https://dev.azure.com/CopDev/"
    ado_project             = "ph_projectName"
    fabric_profile_sku_name = "Standard_F2s_v2"
    max_agents              = 2
    identity = {
      lz_key = "launchpad"
      managed_identity_keys = [
        "level0", "level1"
      ]
    }
  }
}
