# Launchpad - ph_prefix

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
# Login to the subscription Connectivity with the user ph_bootstrap_user_e-mail
rover login -t ph_tenant_name
az rest --method post --url "/providers/Microsoft.Authorization/elevateAccess?api-version=2016-07-01"

```

### Launchpad

```bash
# Login to the subscription Connectivity with the user ph_bootstrap_user_e-mail
rover login -t ph_tenant_name

rover \
  -lz /tf/caf/landingzones/caf_launchpad \
  -var-folder /tf/caf/configuration/level0/launchpad_init \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_identity_subscription_id \
  -tfstate caf_launchpad.tfstate \
  -launchpad \
  -env ph_environment \
  -level level0 \
  -p ${TF_DATA_DIR}/caf_launchpad.tfplan \
  -a plan #-destroy

```

```bash
# On success plan, execute

rover \
  -lz /tf/caf/landingzones/caf_launchpad \
  -var-folder /tf/caf/configuration/level0/launchpad_init \
  -tfstate_subscription_id ph_identity_subscription_id \
  -target_subscription ph_identity_subscription_id \
  -tfstate caf_launchpad.tfstate \
  -launchpad \
  -env ph_environment \
  -level level0 \
  -p ${TF_DATA_DIR}/caf_launchpad.tfplan \
  -a apply

```

## Next steps

When you have successfully deployed the launchpad you can  move to the next step.

 [Deploy the credentials landing zone](../credentials/readme.md)
