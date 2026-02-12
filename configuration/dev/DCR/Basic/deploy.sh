az deployment group create \
  --name BasicMonitoringDeployment \
  --resource-group 'ph_prefix-rg-mgmt' \
  --template-file configuration/dev/DCR/Basic/basicMonitoring.json \
  --parameters configuration/dev/DCR/Basic/parameters.json