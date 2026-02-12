
# Generate launchpad credentials

```bash
# For manual bootstrap:
# Login to the subscription Connectivity with the user ph_bootstrap_user_e-mail
rover login -t ph_tenant_name

rover \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level0/credentials \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_identity_subscription_id \
  -tfstate launchpad_credentials.tfstate \
  -launchpad \
  -env ph_environment \
  -level level0 \
  -p ${TF_DATA_DIR}/launchpad_credentials.tfplan \
  -a plan #-destroy

```

```bash
# After a successful deployment add the impersonation part for ongoing deployments to update the credentials later, when they are expired
#  --impersonate-sp-from-keyvault-url https://ph_prefix-kv-id.vault.azure.net/ \

rover \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level0/credentials \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_identity_subscription_id \
  -tfstate launchpad_credentials.tfstate \
  -launchpad \
  -env ph_environment \
  -level level0 \
  -p ${TF_DATA_DIR}/launchpad_credentials.tfplan \
  -a apply

```

## Next steps

When you have successfully deployed the launchpad you can  move to the next step.

  [Deploy the deployer agent's vnet](../agent/agent-vnet/readme.md)
