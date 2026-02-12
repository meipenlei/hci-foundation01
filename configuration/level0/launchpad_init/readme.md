# Launchpad - hci01

## Pre-requisites

This scenario requires the following privileges:

| Component          | Privileges           |
|--------------------|----------------------|
| Active Directory   | Global Administrator |
| Azure subscription | Subscription owner of the target subscription below!   |

## Deployment

### Pre-requisite

Elevate your credentials to the tenant root level to have enough privileges to create the management group hierarchy.

```bash
# Login to the subscription Connectivity with the user admin@cloudenabler.onmicrosoft.com
rover login -t dacoplab.onmicrosoft.com
az rest --method post --url "/providers/Microsoft.Authorization/elevateAccess?api-version=2016-07-01"

```

### Launchpad

```bash
# Login to the subscription Connectivity with the user admin@cloudenabler.onmicrosoft.com
rover login -t dacoplab.onmicrosoft.com

rover \
  -lz /tf/caf/landingzones/caf_launchpad \
  -var-folder /tf/caf/configuration/level0/launchpad_init \
  -tfstate_subscription_id f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -target_subscription f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -tfstate caf_launchpad.tfstate \
  -launchpad \
  -env DEV \
  -level level0 \
  -p ${TF_DATA_DIR}/caf_launchpad.tfplan \
  -a plan #-destroy

```

```bash
# On success plan, execute

rover \
  -lz /tf/caf/landingzones/caf_launchpad \
  -var-folder /tf/caf/configuration/level0/launchpad_init \
  -tfstate_subscription_id f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -target_subscription f371e124-4b06-46ea-9d63-f51d48d76e64 \
  -tfstate caf_launchpad.tfstate \
  -launchpad \
  -env DEV \
  -level level0 \
  -p ${TF_DATA_DIR}/caf_launchpad.tfplan \
  -a apply

```

## Next steps

When you have successfully deployed the launchpad you can  move to the next step.

 [Deploy the credentials landing zone](../credentials/readme.md)
