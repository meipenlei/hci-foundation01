# Note: close previous session if you logged with a differelevel3nt service principal using --impersonate-sp-from-keyvault-url

```bash

rover logout

## login a with a user member of the caf-maintainers group

rover login -t ph_tenant_name


rover \
  <!-- --impersonate-sp-from-keyvault-url https://ph_prefix-kv-scp.vault.azure.net/ \ -->
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level3/testvm_reg3 \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_identity_subscription_id \
  -tfstate testvm_reg3.tfstate \
  -env ph_environment \
  -level level3 \
  -w tfstate \
  -p ${TF_DATA_DIR}/testvm_reg3.tfplan \
  -a plan #-destroy

rover \
  --impersonate-sp-from-keyvault-url https://ph_prefix-kv-scp.vault.azure.net/ \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level3/testvm_reg3 \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_identity_subscription_id \
  -tfstate testvm_reg3.tfstate \
  -env ph_environment \
  -level level3 \
  -w tfstate \
  -p ${TF_DATA_DIR}/testvm_reg3.tfplan \
  -a apply

```
