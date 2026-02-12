az deployment group create \
  --name CTMonitoringDeployment \
  --resource-group 'ph_prefix-rg-mgmt' \
  --template-file configuration/dev/DCR/CT/CTMonitoring.json \
  --parameters configuration/dev/DCR/CT/parameters.json