
# Note: close previous session if you logged with a different service principal using --impersonate-sp-from-keyvault-url

```bash

rover logout

export AZDO_PERSONAL_ACCESS_TOKEN=<Personal Access Token>
# login a with a user member of the caf-maintainers group
rover login -t ph_tenant_name

rover \
  -lz /tf/caf/landingzones/caf_solution/add-ons/azure_devops_agent \
  -var-folder /tf/caf/configuration/level0/agent/azdo \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_identity_subscription_id \
  -tfstate agent_level0.tfstate \
  -env ph_environment \
  -level level0 \
  -w tfstate \
  -p ${TF_DATA_DIR}/agent_level0.tfplan \
  -a plan #-destroy

rover \
  -lz /tf/caf/landingzones/caf_solution/add-ons/azure_devops_agent \
  -var-folder /tf/caf/configuration/level0/agent/azdo \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_identity_subscription_id \
  -tfstate agent_level0.tfstate \
  -env ph_environment \
  -level level0 \
  -w tfstate \
  -p ${TF_DATA_DIR}/agent_level0.tfplan \
  -a apply

```

 [Deploy the subscription services](../../level1/subscriptions/readme.md)
