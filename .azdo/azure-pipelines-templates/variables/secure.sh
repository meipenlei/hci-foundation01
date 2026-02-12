# This file shouldn't be part ot the git repo because it contains sensitive information and should be listed in .gitignore.

MSI_RESOURCE_ID="ph_MSI_RESOURCE_ID" # This is the MSI resource ID used to authenticate to the target Azure DevOps organization.
TFSTATESUB="ph_identity_subscription_id" # This is the target Azure subscription ID where the Terraform state is stored.
ROVERVERSION="ph_rover_version" # This is the rover version used to deploy the landing zones.
ENVIRONMENT="ph_environment" # This is the environment name used to deploy the landing zones.
AZDO_PAT="ph_AZDO_PAT" # With this PAT the bootstrap pipeline gets the permissions to read a project, manage service connections and manage agent pools during the bootstrap process. After the bootstrap it should be removed.
