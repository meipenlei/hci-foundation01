storage_accounts = {
  # Is used to store the azure devops deployment script to setup the Azure Devops Selfhosted agents
  sa1 = {
    name                     = "hci01sttestsa1"
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
          remote_subnet_id = "/subscriptions/f371e124-4b06-46ea-9d63-f51d48d76e64/resourceGroups/hci01-rg-self-hosted-level0/providers/Microsoft.Network/virtualNetworks/hci01-vnet-mdp/subnets/hci01-snet-frontend"
        }
      }
    }
  }
}
