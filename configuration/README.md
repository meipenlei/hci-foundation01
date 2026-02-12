# Introduction

TODO: Give a short introduction of your project. Let this section explain the objectives or the motivation behind this project.

## Used Variables for Customizing the Deployment for Azure DevOps

|Variable                       | Value                         | Example                                      | Note                                                                 |
| ----------------------------- | ----------------------------- | -------------------------------------------- | -------------------------------------------------------------------- |
|Azure DevOps Organization Name | <https://dev.azure.com/CopDev>| <https://dev.azure.com/CloudEnabler>         | Name of the Azure DevOps Organisation                                |
|Azure DevOps Project Name      | ph_projectName                | CloudenablerTF                               | Name of the Azure DevOps Project                                     |
|Azure DevOps PAT               | ph_AZDO_PAT                   | 452713eessgfaee2eylcawilgn5xnnht3i4234ds.... | With this PAT the bootstrap pipeline gets the permissions to read a project, manage service connections and manage agent pools during the bootstrap process. After the bootstrap it should be removed.|
|Rover Image Version            | meipenleikap/dt1aztfmod:1.12.2-2506.2617              | meipenleikap/dt1aztfmod:1.12.2-2506.2617                              | Which Rover Version is used, the number also refers to the Terraform version.|

## Used Variables for Customizing the Deployment for GitHub

|Variable                       | Value                         | Example                                      | Note                                                                 |
| ----------------------------- | ----------------------------- | -------------------------------------------- | -------------------------------------------------------------------- |
|GitHub Organization Name       | meipenlei            | DevoteamMCloud                               | Name of the GitHub Organisation                                      |
|GitHub Repository Name         | hci-foundation01           | Intelligent_Cloud-CE_For_Foundations_Flexible| Name of the GitHub Repository                                        |
|Rover Image Version            | meipenleikap/dt1aztfmod:1.12.2-2506.2617              | meipenleikap/dt1aztfmod:1.12.2-2506.2617     | Which Rover Version is used, the number also refers to the Terraform version.|

## Used Variables for Customizing the Deployment

|Variable                       | Value                         | Example                                      | Note                                                                 |
| ----------------------------- | ----------------------------- | -------------------------------------------- | -------------------------------------------------------------------- |
|Prefix                         | hci01                     | cetf1                                        | This helps with the creation of names, which must be unique worldwide|
|Environment                    | DEV                | DEV, TEST, PROD                              | Used for Azure DevOps and pipelines, GitHub Environment and workflows and Terraform backend |
|Azure Entra Primary Domain Name| dacoplab.onmicrosoft.com                | CloudEnablerTF.onmicrosoft.com               |                                                                      |
|Azure Entra ID                 | afdc9c9b-90ee-4cfe-b03c-63fd0e65902d                  | 434a1e75-xxxx-42ae-xxxx-1a89f6e05630         |                                                                      |
|Identity Subscription ID       | f371e124-4b06-46ea-9d63-f51d48d76e64   | c9629075-xxxx-4ffd-xx00-05cd6e981b27         | Also target for all terraform statefiles                             |
|Management Subscription ID     | f371e124-4b06-46ea-9d63-f51d48d76e64 | f749b8a6-xxxx-4a2b-xx00-cc2d2baf6fbe         |                                                                      |
|Connectivity Subscription ID   | f371e124-4b06-46ea-9d63-f51d48d76e64 | f371e124-xxxx-46ea-xx00-f51d48d76e64       |                                                                      |
|Application Subscription ID    | f371e124-4b06-46ea-9d63-f51d48d76e64     | 59b69750-b2ad-xxxx-98dd-xxxfd39138fb         |                                                                      |
|Tag                            | hci01             | "solution_topic   = ""CloudEnabler"""        | Used for Standard Tagging                                            |
|Tag                            | IT         | "cost_center      = ""IT"""                  | Used for Standard Tagging                                            |
|Tag                            | Governance         | "cost_center      = ""Governance"""          | Used for Standard Tagging                                            |
|Tag                            | SharedServices         | "cost_center      = ""SharedServices"""      | Used for Standard Tagging                                            |
|Tag                            | Platforms         | "cost_center      = ""Platforms"""           | Used for Standard Tagging                                            |
|Tag                            | Business         | "cost_center      = ""Business"""            | Used for Standard Tagging                                            |
|Tag                            | admin@cloudenabler.onmicrosoft.com    | "cost_responsible = ""<ceo@customer.com>"""  | Used for Standard Tagging                                            |
|Tag                            | admin@cloudenabler.onmicrosoft.com    | "cost_responsible = ""<ceo@customer.com>"""  | Used for Standard Tagging                                            |
|Tag                            | admin@cloudenabler.onmicrosoft.com    | "cost_responsible = ""<ceo@customer.com>"""  | Used for Standard Tagging                                            |
|Tag                            | admin@cloudenabler.onmicrosoft.com    | "cost_responsible = ""<ceo@customer.com>"""  | Used for Standard Tagging                                            |
|Tag                            | admin@cloudenabler.onmicrosoft.com    | "cost_responsible = ""<ceo@customer.com>"""  | Used for Standard Tagging                                            |
|Bootstrap User Email Address   | admin@cloudenabler.onmicrosoft.com      | <admin@cloudenabler.onmicrosoft.com>         | Specify e.g. user admin account                                      |
|MSI Object ID (for automation) | 6455e5c3-d602-41cd-84a3-e903e45fa536   | 673a4999-622b-xxxx-b1be-405271a5b06c         | Specify the bootstrap MSI object id (dont add an object id of a user from admin@cloudenabler.onmicrosoft.com, this will result in duplicate error!) |
|Region1                        | westeurope                    | westeurope                                   |                                                                      |
|Region2                        | northeurope                    | northeurope                                  |                                                                      |
|Root Management Group ID       | hci01                    | cetf1                                        | Usually the same like the prefix                                     |
|Root Management Group Name     | HCI TEST 01                  | Cloud Enabler TF                             | Here the structure with the policies begins                          |
|Parent Root Management Group ID (opt.)| ph_optional_root_parent_id    | cetf1-parent                          | **Optional**: Only if you not starting directy below Tenant Root Group (if not used, then the value is **"root"!**) |
|MSI RESOURCE ID                | /subscriptions/f371e124-4b06-46ea-9d63-f51d48d76e64/resourceGroups/hci01-rg-level0/providers/Microsoft.ManagedIdentity/userAssignedIdentities/hci01-msi-level0            | /subscriptions/bc28a498-xxxx-4121-xxxx-171ef808ba79/resourceGroups/prefix-rg-level0/providers/Microsoft.ManagedIdentity/userAssignedIdentities/prefix-msi-level0               | Used for the agents/runners user definded managed identity to read secrets of service principals to impersonate   |
|MSI MONITORING RESOURCE ID     | /subscriptions/f371e124-4b06-46ea-9d63-f51d48d76e64/resourceGroups/hci01-rg-level1/providers/Microsoft.ManagedIdentity/userAssignedIdentities/hci01-msi-mon            | /subscriptions/bc28a498-xxxx-4121-xxxx-171ef808ba79/resourceGroups/prefix-rg-level1/providers/Microsoft.ManagedIdentity/userAssignedIdentities/prefix-msi-mon                  | Used for monitoring and changetracking   |
