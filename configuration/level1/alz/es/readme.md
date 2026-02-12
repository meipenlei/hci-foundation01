# Enterprise scale

## Deploy Enterprise Scale

Note you need to adjust the branch to deploy Enterprise Scale to 2203.0

```bash
az account clear
# login a with a user member of the caf-platform-maintainers group
rover login -t dacoplab.onmicrosoft.com

rover \
  <!-- --impersonate-sp-from-keyvault-url https://hci01-kv-es.vault.azure.net/ \ -->
  -lz /tf/caf/landingzones/caf_solution/add-ons/caf_eslz \
  -var-folder /tf/caf/configuration/level1/alz/es \
  -tfstate_subscription_id f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -target_subscription f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -tfstate alz_es.tfstate \
  -env DEV \
  -level level1 \
  -p ${TF_DATA_DIR}/alz_es.tfplan \
  -a plan #-destroy

rover \
  --impersonate-sp-from-keyvault-url https://hci01-kv-es.vault.azure.net/ \
  -lz /tf/caf/landingzones/caf_solution/add-ons/caf_eslz \
  -var-folder /tf/caf/configuration/level1/alz/es \
  -tfstate_subscription_id f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -target_subscription f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -tfstate alz_es.tfstate \
  -env DEV \
  -level level1 \
  -p ${TF_DATA_DIR}/alz_es.tfplan \
  -a apply

```

## Next steps

[Deploy Connectivity Hub VNet](../../../level2/connectivity/we_hub//readme.md)
