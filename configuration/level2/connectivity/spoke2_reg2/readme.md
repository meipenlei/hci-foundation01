# Hints and scripts for executing the deployments

Note: close previous session if you logged with a differelevel2nt service principal using --impersonate-sp-from-keyvault-url

```bash
rover logout

## login a with a user member of the caf-maintainers group

rover login -t dacoplab.onmicrosoft.com

rover \
  <!-- --impersonate-sp-from-keyvault-url https://hci01-kv-co.vault.azure.net/ \ -->
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level2/connectivity/spoke2_reg2 \
  -tfstate_subscription_id f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -target_subscription f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -tfstate connectivity_spoke2_ne.tfstate \
  -env DEV \
  -level level2 \
  -w tfstate \
  -p ${TF_DATA_DIR}/connectivity_spoke2_ne.tfplan \
  -a plan #-destroy


rover \
  --impersonate-sp-from-keyvault-url https://hci01-kv-co.vault.azure.net/ \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level2/connectivity/spoke2_reg2 \
  -tfstate_subscription_id f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -target_subscription f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -tfstate connectivity_spoke2_ne.tfstate \
  -env DEV \
  -level level2 \
  -w tfstate \
  -p ${TF_DATA_DIR}/connectivity_spoke2_ne.tfplan \
  -a apply

```
