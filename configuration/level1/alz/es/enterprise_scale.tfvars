# relative path to /tf/caf/landingzones/caf_solution/add-ons/caf_alz
library_path                = "/tf/caf/configuration/level1/alz/es/lib"
#root_parent_id              = "ph_optional_root_parent_id"    # optional, if not set the root will be created in the tenant root
root_id                     = "ph_prefix"                 # usually the same like the prefix
root_name                   = "ph_root_name"
deploy_core_landing_zones   = true
disable_telemetry           = true
deploy_corp_landing_zones   = true
deploy_online_landing_zones = true
deploy_sap_landing_zones    = false

# pass custom template file variables if needed map(any)
template_file_variables = {}
