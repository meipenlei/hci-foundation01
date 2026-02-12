
# Management

Deploy the management services

```bash
#Note: close previous session if you logged with a different service principal using --impersonate-sp-from-keyvault-url
rover logout

# login a with a user member of the caf-maintainers group
rover login -t ph_tenant_name

rover \
  <!-- --impersonate-sp-from-keyvault-url https://ph_prefix-kv-mg.vault.azure.net/ \ -->
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level1/management \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_management_subscription_id \
  -tfstate management.tfstate \
  -env ph_environment \
  -level level1 \
  -p ${TF_DATA_DIR}/management.tfplan \
  -a plan #-destroy

rover \
  --impersonate-sp-from-keyvault-url https://ph_prefix-kv-mg.vault.azure.net/ \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level1/management \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_management_subscription_id \
  -tfstate management.tfstate \
  -env ph_environment \
  -level level1 \
  -p ${TF_DATA_DIR}/management.tfplan \
  -a apply

```

## Next steps

When you have successfully deployed the management landing zone, you can move to the next step:

[Deploy Identity](../identity/readme.md)
