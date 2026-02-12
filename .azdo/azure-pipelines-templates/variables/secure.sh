# This file shouldn't be part ot the git repo because it contains sensitive information and should be listed in .gitignore.

MSI_RESOURCE_ID="/subscriptions/f371e124-4b06-46ea-9d63-f51d48d76e64/resourceGroups/hci01-rg-level0/providers/Microsoft.ManagedIdentity/userAssignedIdentities/hci01-msi-level0" # This is the MSI resource ID used to authenticate to the target Azure DevOps organization.
TFSTATESUB="f371e124-4b06-46ea-9d63-f51d48d76e64" # This is the target Azure subscription ID where the Terraform state is stored.
ROVERVERSION="meipenleikap/dt1aztfmod:1.12.2-2506.2617" # This is the rover version used to deploy the landing zones.
ENVIRONMENT="DEV" # This is the environment name used to deploy the landing zones.
AZDO_PAT="ph_AZDO_PAT" # With this PAT the bootstrap pipeline gets the permissions to read a project, manage service connections and manage agent pools during the bootstrap process. After the bootstrap it should be removed.
