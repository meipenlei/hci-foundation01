# configuration tfvars for vnet
vnets = {
  spoke1 = {
    resource_group_key = "rg1"
    vnet = {
      name          = "mdp"
      address_space = ["192.168.1.0/24"]
      dns_servers   = []
    }
    specialsubnets = {}
    subnets = {
      frontend = {
        name            = "frontend"
        cidr            = ["192.168.1.0/28"]
        nsg_key         = "frontend"
        route_table_key = "internet"
        service_endpoints = [
          "Microsoft.Storage.Global",
          "Microsoft.KeyVault",
        ]
        # # IMPORTANT: Delegation for Managed DevOps Pools
        # delegation = {
        #   name               = "devops-delegation"
        #   service_delegation = "Microsoft.DevOpsInfrastructure/pools"
        #   actions            = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
        # }
      }
    }
  }
}

# nsg.tfvars
network_security_group_definition = {

  frontend = {

    nsg = [
      {
        name                       = "allow-icmp"
        priority                   = "101"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "icmp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "VirtualNetwork"
        destination_address_prefix = "*"
      },
      {
        name                       = "ssh-inbound-22",
        priority                   = "210"
        direction                  = "Inbound"
        access                     = "Deny"
        protocol                   = "tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "rdp-remote",
        priority                   = "102"
        direction                  = "Inbound"
        access                     = "Deny"
        protocol                   = "tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "VirtualNetwork"
      },
    ]
  }
}

# routes.tfvars for no Internet

route_tables = {
  no_internet = {
    name               = "no_internet"
    resource_group_key = "rg1"
  }
  internet = {
    name               = "internet"
    resource_group_key = "rg1"
  }

}

azurerm_routes = {
  no_internet = {
    name               = "no_internet"
    resource_group_key = "rg1"
    route_table_key    = "no_internet"
    address_prefix     = "0.0.0.0/0"
    next_hop_type      = "None"
  }
  internet = {
    name               = "internet"
    resource_group_key = "rg1"
    route_table_key    = "internet"
    address_prefix     = "0.0.0.0/0"
    next_hop_type      = "Internet"
  }
}
