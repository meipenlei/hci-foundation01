# Enterprise scale

## Deploy Enterprise Scale

Note you need to adjust the branch to deploy Enterprise Scale to 2203.0

```bash
az account clear
# login a with a user member of the caf-platform-maintainers group
rover login -t ph_tenant_name

rover \
  <!-- --impersonate-sp-from-keyvault-url https://ph_prefix-kv-es.vault.azure.net/ \ -->
  -lz /tf/caf/landingzones/caf_solution/add-ons/caf_eslz \
  -var-folder /tf/caf/configuration/level1/alz/es \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_management_subscription_id \
  -tfstate alz_es.tfstate \
  -env ph_environment \
  -level level1 \
  -p ${TF_DATA_DIR}/alz_es.tfplan \
  -a plan #-destroy

rover \
  --impersonate-sp-from-keyvault-url https://ph_prefix-kv-es.vault.azure.net/ \
  -lz /tf/caf/landingzones/caf_solution/add-ons/caf_eslz \
  -var-folder /tf/caf/configuration/level1/alz/es \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_management_subscription_id \
  -tfstate alz_es.tfstate \
  -env ph_environment \
  -level level1 \
  -p ${TF_DATA_DIR}/alz_es.tfplan \
  -a apply

```

## Next steps

[Deploy Connectivity Hub VNet](../../../level2/connectivity/we_hub//readme.md)
