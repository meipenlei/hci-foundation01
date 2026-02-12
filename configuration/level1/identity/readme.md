
# Identity

Deploy the identity services

```bash
#Note: close previous session if you logged with a different service principal using --impersonate-sp-from-keyvault-url
rover logout

# login a with a user member of the caf-maintainers group
rover login -t dacoplab.onmicrosoft.com

rover \
  <!-- --impersonate-sp-from-keyvault-url https://hci01-kv-id.vault.azure.net/ \ -->
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level1/identity \
  -tfstate_subscription_id f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -target_subscription f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -tfstate identity.tfstate \
  -env DEV \
  -level level1 \
  -p ${TF_DATA_DIR}/identity.tfplan \
  -a plan #-destroy

rover \
  --impersonate-sp-from-keyvault-url https://hci01-kv-id.vault.azure.net/ \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level1/identity \
  -tfstate_subscription_id f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -target_subscription f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -tfstate identity.tfstate \
  -env DEV \
  -level level1 \
  -p ${TF_DATA_DIR}/identity.tfplan \
  -a apply

```

## Next steps

[Deploy Enterprise Scale - region1](../alz/es/readme.md)
