storage_accounts = {
  # Is used to store the azure devops deployment script to setup the Azure Devops Selfhosted agents
  sa1 = {
    name                     = "ph_prefixsttestsa1"
    resource_group_key       = "rg1"
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "LRS"

    containers = {
      test = {
        name = "test"
      }
    }
    network = {
      bypass   = ["Logging", "Metrics", "AzureServices"] #optional. Valid options are any combination of Logging, Metrics, AzureServices, or None
      ip_rules = []                                      #optional. The prefix of ip_rules must be between 0 and 30 and only supports public IP addresses.
      subnets = {
        #add multiple subnets by extending this block. You can reference remote subnets by using remote_subnet_id
        subnet1 = {
          remote_subnet_id = "/subscriptions/ph_identity_subscription_id/resourceGroups/ph_prefix-rg-self-hosted-level0/providers/Microsoft.Network/virtualNetworks/ph_prefix-vnet-mdp/subnets/ph_prefix-snet-frontend"
        }
      }
    }
  }
}
