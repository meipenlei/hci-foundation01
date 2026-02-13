
# Platform subscriptions

Set-up the subscription delegations for platform and landingzone subscriptions

```bash
# For manual bootstrap:
# Login to the subscription Connectivity with the user mjacob@dacoplab.onmicrosoft.com
rover login -t dacoplab.onmicrosoft.com

rover \
  <!-- --impersonate-sp-from-keyvault-url https://hci01-kv-es.vault.azure.net/  \ -->
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level1/subscriptions \
  -tfstate_subscription_id f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -target_subscription f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -tfstate subscriptions.tfstate \
  -env DEV \
  -level level1 \
  -p ${TF_DATA_DIR}/subscriptions.tfplan \
  -a plan #-destroy

rover \
  --impersonate-sp-from-keyvault-url https://hci01-kv-es.vault.azure.net/  \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level1/subscriptions \
  -tfstate_subscription_id f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -target_subscription f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -tfstate subscriptions.tfstate \
  -env DEV \
  -level level1 \
  -p ${TF_DATA_DIR}/subscriptions.tfplan \
  -a apply

```

## Next steps

When you have successfully deployed the subscriptions management landing zone, you can move to the next step:

[Deploy the management services](../management/readme.md)
