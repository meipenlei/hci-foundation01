# Note: close previous session if you logged with a differelevel2nt service principal using --impersonate-sp-from-keyvault-url

```bash

rover logout

## login a with a user member of the caf-maintainers group

rover login -t dacoplab.onmicrosoft.com


rover \
  <!-- --impersonate-sp-from-keyvault-url https://hci01-kv-id.vault.azure.net/ \ -->
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level2/identity/dc1_reg1 \
  -tfstate_subscription_id f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -target_subscription f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -tfstate dc1_reg1.tfstate \
  -env DEV \
  -level level2 \
  -w tfstate \
  -p ${TF_DATA_DIR}/dc1_reg1.tfplan \
  -a plan #-destroy

rover \
  --impersonate-sp-from-keyvault-url https://hci01-kv-id.vault.azure.net/ \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level2/identity/dc1_reg1 \
  -tfstate_subscription_id f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -target_subscription f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -tfstate dc1_reg1.tfstate \
  -env DEV \
  -level level2 \
  -w tfstate \
  -p ${TF_DATA_DIR}/dc1_reg1.tfplan \
  -a apply

```
