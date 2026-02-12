az deployment group create \
  --name CTMonitoringDeployment \
  --resource-group 'hci01-rg-mgmt' \
  --template-file configuration/dev/DCR/CT/CTMonitoring.json \
  --parameters configuration/dev/DCR/CT/parameters.json