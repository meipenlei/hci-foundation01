
# Identity

Deploy the identity services

```bash
#Note: close previous session if you logged with a different service principal using --impersonate-sp-from-keyvault-url
rover logout

# login a with a user member of the caf-maintainers group
rover login -t ph_tenant_name

rover \
  <!-- --impersonate-sp-from-keyvault-url https://ph_prefix-kv-id.vault.azure.net/ \ -->
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level1/identity \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_identity_subscription_id \
  -tfstate identity.tfstate \
  -env ph_environment \
  -level level1 \
  -p ${TF_DATA_DIR}/identity.tfplan \
  -a plan #-destroy

rover \
  --impersonate-sp-from-keyvault-url https://ph_prefix-kv-id.vault.azure.net/ \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level1/identity \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_identity_subscription_id \
  -tfstate identity.tfstate \
  -env ph_environment \
  -level level1 \
  -p ${TF_DATA_DIR}/identity.tfplan \
  -a apply

```

## Next steps

[Deploy Enterprise Scale - region1](../alz/es/readme.md)
