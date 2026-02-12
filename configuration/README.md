# Introduction

TODO: Give a short introduction of your project. Let this section explain the objectives or the motivation behind this project.

## Used Variables for Customizing the Deployment for Azure DevOps

|Variable                       | Value                         | Example                                      | Note                                                                 |
| ----------------------------- | ----------------------------- | -------------------------------------------- | -------------------------------------------------------------------- |
|Azure DevOps Organization Name | ph_DevOpsOrg                  | <https://dev.azure.com/CloudEnabler>         | Name of the Azure DevOps Organisation                                |
|Azure DevOps Project Name      | ph_projectName                | CloudenablerTF                               | Name of the Azure DevOps Project                                     |
|Azure DevOps PAT               | ph_AZDO_PAT                   | 452713eessgfaee2eylcawilgn5xnnht3i4234ds.... | With this PAT the bootstrap pipeline gets the permissions to read a project, manage service connections and manage agent pools during the bootstrap process. After the bootstrap it should be removed.|
|Rover Image Version            | ph_rover_version              | meipenleikap/dt1aztfmod:1.12.2-2506.2617                              | Which Rover Version is used, the number also refers to the Terraform version.|

## Used Variables for Customizing the Deployment for GitHub

|Variable                       | Value                         | Example                                      | Note                                                                 |
| ----------------------------- | ----------------------------- | -------------------------------------------- | -------------------------------------------------------------------- |
|GitHub Organization Name       | ph_GitHub_Org_Name            | DevoteamMCloud                               | Name of the GitHub Organisation                                      |
|GitHub Repository Name         | ph_GitHub_Repo_Name           | Intelligent_Cloud-CE_For_Foundations_Flexible| Name of the GitHub Repository                                        |
|Rover Image Version            | ph_rover_version              | meipenleikap/dt1aztfmod:1.12.2-2506.2617     | Which Rover Version is used, the number also refers to the Terraform version.|

## Used Variables for Customizing the Deployment

|Variable                       | Value                         | Example                                      | Note                                                                 |
| ----------------------------- | ----------------------------- | -------------------------------------------- | -------------------------------------------------------------------- |
|Prefix                         | ph_prefix                     | cetf1                                        | This helps with the creation of names, which must be unique worldwide|
|Environment                    | ph_environment                | DEV, TEST, PROD                              | Used for Azure DevOps and pipelines, GitHub Environment and workflows and Terraform backend |
|Azure Entra Primary Domain Name| ph_tenant_name                | CloudEnablerTF.onmicrosoft.com               |                                                                      |
|Azure Entra ID                 | ph_tenant_id                  | 434a1e75-xxxx-42ae-xxxx-1a89f6e05630         |                                                                      |
|Identity Subscription ID       | ph_identity_subscription_id   | c9629075-xxxx-4ffd-xx00-05cd6e981b27         | Also target for all terraform statefiles                             |
|Management Subscription ID     | ph_management_subscription_id | f749b8a6-xxxx-4a2b-xx00-cc2d2baf6fbe         |                                                                      |
|Connectivity Subscription ID   | ph_connectivity_subscription_id | f371e124-xxxx-46ea-xx00-f51d48d76e64       |                                                                      |
|Application Subscription ID    | ph_app001_subscription_id     | 59b69750-b2ad-xxxx-98dd-xxxfd39138fb         |                                                                      |
|Tag                            | ph_customer_topic             | "solution_topic   = ""CloudEnabler"""        | Used for Standard Tagging                                            |
|Tag                            | ph_cost_center_level0         | "cost_center      = ""IT"""                  | Used for Standard Tagging                                            |
|Tag                            | ph_cost_center_level1         | "cost_center      = ""Governance"""          | Used for Standard Tagging                                            |
|Tag                            | ph_cost_center_level2         | "cost_center      = ""SharedServices"""      | Used for Standard Tagging                                            |
|Tag                            | ph_cost_center_level3         | "cost_center      = ""Platforms"""           | Used for Standard Tagging                                            |
|Tag                            | ph_cost_center_level4         | "cost_center      = ""Business"""            | Used for Standard Tagging                                            |
|Tag                            | ph_cost_responsible_level0    | "cost_responsible = ""<ceo@customer.com>"""  | Used for Standard Tagging                                            |
|Tag                            | ph_cost_responsible_level1    | "cost_responsible = ""<ceo@customer.com>"""  | Used for Standard Tagging                                            |
|Tag                            | ph_cost_responsible_level2    | "cost_responsible = ""<ceo@customer.com>"""  | Used for Standard Tagging                                            |
|Tag                            | ph_cost_responsible_level3    | "cost_responsible = ""<ceo@customer.com>"""  | Used for Standard Tagging                                            |
|Tag                            | ph_cost_responsible_level4    | "cost_responsible = ""<ceo@customer.com>"""  | Used for Standard Tagging                                            |
|Bootstrap User Email Address   | ph_bootstrap_user_e-mail      | <admin@cloudenabler.onmicrosoft.com>         | Specify e.g. user admin account                                      |
|MSI Object ID (for automation) | ph_bootstrapper_object_id   | 673a4999-622b-xxxx-b1be-405271a5b06c         | Specify the bootstrap MSI object id (dont add an object id of a user from ph_bootstrap_user_e-mail, this will result in duplicate error!) |
|Region1                        | ph_region1                    | westeurope                                   |                                                                      |
|Region2                        | ph_region2                    | northeurope                                  |                                                                      |
|Root Management Group ID       | ph_root_id                    | cetf1                                        | Usually the same like the prefix                                     |
|Root Management Group Name     | ph_root_name                  | Cloud Enabler TF                             | Here the structure with the policies begins                          |
|Parent Root Management Group ID (opt.)| ph_optional_root_parent_id    | cetf1-parent                          | **Optional**: Only if you not starting directy below Tenant Root Group (if not used, then the value is **"root"!**) |
|MSI RESOURCE ID                | ph_MSI_RESOURCE_ID            | /subscriptions/bc28a498-xxxx-4121-xxxx-171ef808ba79/resourceGroups/prefix-rg-level0/providers/Microsoft.ManagedIdentity/userAssignedIdentities/prefix-msi-level0               | Used for the agents/runners user definded managed identity to read secrets of service principals to impersonate   |
|MSI MONITORING RESOURCE ID     | ph_MON_MSI_RESOURCE_ID            | /subscriptions/bc28a498-xxxx-4121-xxxx-171ef808ba79/resourceGroups/prefix-rg-level1/providers/Microsoft.ManagedIdentity/userAssignedIdentities/prefix-msi-mon                  | Used for monitoring and changetracking   |
