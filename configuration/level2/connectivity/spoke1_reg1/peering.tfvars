# to peer with a vnet in a different subscription you can reference the id in from or tobastion
# or use vnet_key and lz_key 

vnet_peerings_v1 = {

  vnet1_TO_vnet2 = {
    name = "spoke1_reg1_TO_hub_reg3"
    from = {
      vnet_key = "vnet1"
    }
    to = {
      lz_key   = "connectivity_hub_reg3"
      vnet_key = "vnet1"
    }
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

  vnet2_TO_vnet1 = {
    name = "hub_reg3_TO_spoke1_reg1"
    from = {
      lz_key   = "connectivity_hub_reg3"
      vnet_key = "vnet1"
    }
    to = {
      vnet_key = "vnet1"
    }
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }
}
