# Bootstrap Pipelines

The bootstrap pipelines deploy all level0 artifacts in two stages.

## [Bootstrap Part 1](./bootstrap-1.yml)

- [Launchpad](./../../configuration/level0/launchpad/)
- [Credentials](./../../configuration/level0/credentials/)

## [Bootstrap Part 2](./bootstrap-2.yml)

- [AgentLevel0](./../../configuration/level0/agent/azdo_mdp)

## Prerequisites

This scenario requires a user-managed identity with workload federation service connection in Azure DevOps.

The user-managed identity requires the following privileges:

| Component             | Privileges / Roles        |
|-----------------------|---------------------------|
| Active Directory      | Global Administrator      |
| Management Group Root | User Access Administrator |
| Azure Subscription    | Owner                     |

### Variable Group Configuration

A Variable Group named `LandingZoneRepo` is required with the following secret variable:

- **Secret Variable**: `AZDO_PAT="$AZDO_PAT"`

> **Note**: This variable will be created with the execution of `.azdo/azure-pipelines-templates/variables/variable_groups_LandingZoneRepo.sh`


## Execution

Pipeline defaults for `environment` and `wlf_service_connection` parameters need to be overwritten with values for the new environment.

- `environment` - The name of the environment for both Azure Pipelines Environment and Terraform environment (e.g., DEV, TEST, PROD)
- `wlf_service_connection` - Set to "msi-bootstrap"; must also be the name of the workload federation managed identity service connection in Azure DevOps

### Steps

1. **Run the bootstrap-1 pipeline** until it succeeds
   > ⚠️ **Warning**: If it fails, you need to delete everything and start from the beginning, as workloads may be deployed without a valid Terraform statefile.

2. **Run the bootstrap-2 pipeline** until it succeeds

After completion, level0 including self-hosted agent(s) will be set up.

### Next Steps

Run launchpad, credentials, and agent again with the self-hosted agent(s) in place to harden the setup.
