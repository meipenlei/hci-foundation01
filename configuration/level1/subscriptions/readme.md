
# Platform subscriptions

Set-up the subscription delegations for platform and landingzone subscriptions

```bash
# For manual bootstrap:
# Login to the subscription Connectivity with the user ph_bootstrap_user_e-mail
rover login -t ph_tenant_name

rover \
  <!-- --impersonate-sp-from-keyvault-url https://ph_prefix-kv-es.vault.azure.net/  \ -->
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level1/subscriptions \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_management_subscription_id \
  -tfstate subscriptions.tfstate \
  -env ph_environment \
  -level level1 \
  -p ${TF_DATA_DIR}/subscriptions.tfplan \
  -a plan #-destroy

rover \
  --impersonate-sp-from-keyvault-url https://ph_prefix-kv-es.vault.azure.net/  \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level1/subscriptions \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_management_subscription_id \
  -tfstate subscriptions.tfstate \
  -env ph_environment \
  -level level1 \
  -p ${TF_DATA_DIR}/subscriptions.tfplan \
  -a apply

```

## Next steps

When you have successfully deployed the subscriptions management landing zone, you can move to the next step:

[Deploy the management services](../management/readme.md)
