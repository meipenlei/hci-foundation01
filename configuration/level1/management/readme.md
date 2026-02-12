
# Management

Deploy the management services

```bash
#Note: close previous session if you logged with a different service principal using --impersonate-sp-from-keyvault-url
rover logout

# login a with a user member of the caf-maintainers group
rover login -t dacoplab.onmicrosoft.com

rover \
  <!-- --impersonate-sp-from-keyvault-url https://hci01-kv-mg.vault.azure.net/ \ -->
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level1/management \
  -tfstate_subscription_id f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -target_subscription f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -tfstate management.tfstate \
  -env DEV \
  -level level1 \
  -p ${TF_DATA_DIR}/management.tfplan \
  -a plan #-destroy

rover \
  --impersonate-sp-from-keyvault-url https://hci01-kv-mg.vault.azure.net/ \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level1/management \
  -tfstate_subscription_id f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -target_subscription f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -tfstate management.tfstate \
  -env DEV \
  -level level1 \
  -p ${TF_DATA_DIR}/management.tfplan \
  -a apply

```

## Next steps

When you have successfully deployed the management landing zone, you can move to the next step:

[Deploy Identity](../identity/readme.md)
