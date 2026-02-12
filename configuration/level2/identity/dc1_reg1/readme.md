# Note: close previous session if you logged with a differelevel2nt service principal using --impersonate-sp-from-keyvault-url

```bash

rover logout

## login a with a user member of the caf-maintainers group

rover login -t ph_tenant_name


rover \
  <!-- --impersonate-sp-from-keyvault-url https://ph_prefix-kv-id.vault.azure.net/ \ -->
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level2/identity/dc1_reg1 \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_identity_subscription_id \
  -tfstate dc1_reg1.tfstate \
  -env ph_environment \
  -level level2 \
  -w tfstate \
  -p ${TF_DATA_DIR}/dc1_reg1.tfplan \
  -a plan #-destroy

rover \
  --impersonate-sp-from-keyvault-url https://ph_prefix-kv-id.vault.azure.net/ \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level2/identity/dc1_reg1 \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_identity_subscription_id \
  -tfstate dc1_reg1.tfstate \
  -env ph_environment \
  -level level2 \
  -w tfstate \
  -p ${TF_DATA_DIR}/dc1_reg1.tfplan \
  -a apply

```
