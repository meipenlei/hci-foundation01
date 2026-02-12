# Note: close previous session if you logged with a different service principal using --impersonate-sp-from-keyvault-url

```bash

rover logout

export AZDO_PERSONAL_ACCESS_TOKEN=<Personal Access Token>
# login a with a user member of the caf-maintainers group
rover login -t dacoplab.onmicrosoft.com

rover \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level0/agent/runner \
  -tfstate_subscription_id f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -target_subscription f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -tfstate runner_level0.tfstate \
  -env DEV \
  -level level0 \
  -w tfstate \
  -p ${TF_DATA_DIR}/runner_level0.tfplan \
  -a plan #-destroy

rover \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level0/agent/runner \
  -tfstate_subscription_id f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -target_subscription f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -tfstate runner_level0.tfstate \
  -env DEV \
  -level level0 \
  -w tfstate \
  -p ${TF_DATA_DIR}/runner_level0.tfplan \
  -a apply

```

 [Deploy the subscription services](../../level1/subscriptions/readme.md)
