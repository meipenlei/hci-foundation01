# configuration tfvars for vnet
vnets = {
  vnet1 = {
    resource_group_key = "rg1"
    vnet = {
      name          = "spoke1"
      address_space = ["10.100.1.0/24"]
      #dns_servers   = ["10.100.1.36", "10.10.7.72", "10.10.7.71"]
      # dns_servers_keys = {
      #   ip1 = {
      #     lz_key          = "" # must be in a remote deployment, no uncomment
      #     key             = ""
      # .   resource_type   = "azurerm_firewall"
      #     interface_index = 0 #Optional it will take 0.
      #
      #   }
      #   ip2 = {
      #     lz_key          = "" # must be in a remote deployment, no uncomment
      #     key             = ""
      #     resource_type   = "azurerm_firewall"
      #   }
      # }
    }
    specialsubnets = {}
    subnets = {
      frontend = {
        name            = "frontend"
        cidr            = ["10.100.1.32/27"]
        nsg_key         = "frontend"
        route_table_key = "internet"
      }
      applayer = {
        name            = "applayer"
        cidr            = ["10.100.1.96/27"]
        nsg_key         = "applayer"
        route_table_key = "internet"
      }
      backend = {
        name            = "backend"
        cidr            = ["10.100.1.128/27"]
        nsg_key         = "backend"
        route_table_key = "no_internet"
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
        name                       = "allow-ssh-inbound-22",
        priority                   = "210"
        direction                  = "Inbound"
        access                     = "Deny"
        protocol                   = "tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "VirtualNetwork"
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

  applayer = {

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
    ]
  }

  backend = {

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
    ]
  }
}

# standard routes.tfvars for noInternet and internet

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
