
# Generate launchpad credentials

```bash
# For manual bootstrap:
# Login to the subscription Connectivity with the user mjacob@dacoplab.onmicrosoft.com
rover login -t dacoplab.onmicrosoft.com

rover \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level0/credentials \
  -tfstate_subscription_id f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -target_subscription f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -tfstate launchpad_credentials.tfstate \
  -launchpad \
  -env DEV \
  -level level0 \
  -p ${TF_DATA_DIR}/launchpad_credentials.tfplan \
  -a plan #-destroy

```

```bash
# After a successful deployment add the impersonation part for ongoing deployments to update the credentials later, when they are expired
#  --impersonate-sp-from-keyvault-url https://hci01-kv-id.vault.azure.net/ \

rover \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level0/credentials \
  -tfstate_subscription_id f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -target_subscription f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -tfstate launchpad_credentials.tfstate \
  -launchpad \
  -env DEV \
  -level level0 \
  -p ${TF_DATA_DIR}/launchpad_credentials.tfplan \
  -a apply

```

## Next steps

When you have successfully deployed the launchpad you can  move to the next step.

  [Deploy the deployer agent's vnet](../agent/agent-vnet/readme.md)
