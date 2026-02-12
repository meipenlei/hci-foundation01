# naming convention settings
# for more settings on naming convention, please refer to the provider documentation: https://github.com/aztfmod/terraform-provider-azurecaf
#
# passthrough means the default CAF naming convention is not applied and you are responsible
# of the unicity of the names you are giving. the CAF provider will clear out
passthrough = false
# adds random chars at the end of the names produced by the provider
# Do not change the following values once the launchpad deployed.
# Enable tag inheritance (can be changed)
inherit_tags = true
# When passthrough is set to false, define the number of random characters to add to the names
random_length = 0
# Set the prefix that will be added to all azure resources.
# if not set and passthrough=false, the CAF module generates a random one.
prefix = "ph_prefix"
suffix = ""

# Default region. When not set to a resource it will use that value
default_region = "region1"

# You can reference the regions by using region1, region2 or set your own keys
regions = {
  region1 = "ph_region1"
  region2 = "ph_region2"
}

# Enviroment setting
environment = "ph_environment"

# Rover will adjust some tags to enable the discovery of the launchpad.
launchpad_key_names = {
  keyvault = "level0"
  tfstates = [
    "level0",
    "level1",
    "level2",
    "level3",
    "level4"
  ]
}

