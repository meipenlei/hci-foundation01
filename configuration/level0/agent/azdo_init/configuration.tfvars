azure_devops = {
  url     = "https://dev.azure.com/CopDev/"
  project = "ph_projectName"
  #use_msi = true

  service_connection = {
    name         = "agent-level0-sc"
    lz_key       = "launchpad"
    identity_key = "agentl0sc"
  }

  agent_pool = {
    name           = "level0"
    auto_provision = true
    num_agents     = 1
  }
}
