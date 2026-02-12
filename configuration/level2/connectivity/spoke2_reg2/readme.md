# Hints and scripts for executing the deployments

Note: close previous session if you logged with a differelevel2nt service principal using --impersonate-sp-from-keyvault-url

```bash
rover logout

## login a with a user member of the caf-maintainers group

rover login -t ph_tenant_name

rover \
  <!-- --impersonate-sp-from-keyvault-url https://ph_prefix-kv-co.vault.azure.net/ \ -->
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level2/connectivity/spoke2_reg2 \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_connectivity_subscription_id \
  -tfstate connectivity_spoke2_ne.tfstate \
  -env ph_environment \
  -level level2 \
  -w tfstate \
  -p ${TF_DATA_DIR}/connectivity_spoke2_ne.tfplan \
  -a plan #-destroy


rover \
  --impersonate-sp-from-keyvault-url https://ph_prefix-kv-co.vault.azure.net/ \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level2/connectivity/spoke2_reg2 \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_connectivity_subscription_id \
  -tfstate connectivity_spoke2_ne.tfstate \
  -env ph_environment \
  -level level2 \
  -w tfstate \
  -p ${TF_DATA_DIR}/connectivity_spoke2_ne.tfplan \
  -a apply

```
