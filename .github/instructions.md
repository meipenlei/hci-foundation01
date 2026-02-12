# GitHub Actions Workflows

The GitHub Actions workflows deploy all level0 artifacts in two stages using GitHub's CI/CD platform.

## [Bootstrap Part 1](./workflows/bootstrap-1.yml)

- [Launchpad](./../configuration/level0/launchpad/)
- [Credentials](./../configuration/level0/credentials/)

## [Bootstrap Part 2](./workflows/bootstrap-2.yml)

- [AgentLevel0](./../configuration/level0/agent/runner)

## Additional Workflows

- [**Azure Launchpad Pipelines**](./workflows/azure-launchpad-pipelines.yml) - Manages launchpad deployments
- [**Azure Landing Zone Pipelines**](./workflows/azure-lz-pipelines.yml) - Deploys landing zone configurations
- [**Create Environments**](./workflows/create-environments.yml) - Sets up GitHub environments
- [**Cleanup**](./workflows/cleanup.yml) - Cleanup and teardown operations

## Prerequisites

This scenario requires the following setup:

### GitHub Environment Configuration

The workflows require GitHub environments named `credentials` to be configured **manually** with the following secrets and variables:

| Component             | Type     | Description                      |
|-----------------------|----------|----------------------------------|
| GitHub Repository     | Secret   | `PAT_GITHUB_ENVIRONMENT`        |
| GitHub Repository     | Secret   | `PAT_GITHUB_RUNNER`            |
| Azure Subscription   | Secret   | `AZURE_CLIENT_ID`               |
| Azure Subscription   | Secret   | `AZURE_TENANT_ID`               |
| Azure Subscription   | Secret   | `AZURE_SUBSCRIPTION_ID`         |
| APPLICATION_SUBSCRIPTION_ID            | Variable | `APPLICATION_SUBSCRIPTION_ID`                   |
| CONNECTIVITY_SUBSCRIPTION_ID        | Variable | `CONNECTIVITY_SUBSCRIPTION_ID`                    |
| ENVIRONMENT         | Variable | `ENVIRONMENT`               |
| IDENTITY_SUBSCRIPTION_ID         | Variable | `IDENTITY_SUBSCRIPTION_ID`               |
| MANAGEMENT_SUBSCRIPTION_ID        | Variable | `MANAGEMENT_SUBSCRIPTION_ID`                    |
| MSI_RESOURCE_ID         | Variable | `MSI_RESOURCE_ID`               |
| PREFIX         | Variable | `PREFIX`               |

### Required Permissions

The federated identity or service principal requires the following privileges:

| Component             | Privileges / Roles        |
|-----------------------|---------------------------|
| Active Directory      | Global Administrator      |
| Management Group Root | User Access Administrator |
| Azure Subscription    | Owner                     |

### Custom Actions

The repository includes a custom action for environment management:

- [**Create GitHub Environment**](./workflows/create-github-environment/) - Automates GitHub environment creation with required secrets and variables

## Execution

### Workflow Parameters

All workflows support the following common parameters:

- `environment` - The name of the target environment (e.g., DEV, TEST, PROD)
- `terraformAction` - Choose between 'apply' or 'destroy' operations
- `timeoutInMinutes` - Workflow timeout duration (default: 90 minutes)
- `parallelism` - Terraform parallelism setting (default: 10-30 depending on workflow)

### Steps

1. **Set up GitHub Environments**
   - Create environments for each target (DEV, TEST, PROD)
   - Configure required secrets and variables
   - Set up environment protection rules if needed

2. **Run the Bootstrap Part 1 workflow** until it succeeds
   > ⚠️ **Warning**: If it fails, you need to delete everything and start from the beginning, as workloads may be deployed without a valid Terraform statefile.

3. **Run the Bootstrap Part 2 workflow** until it succeeds

After completion, level0 including self-hosted agents will be set up.

### Next Steps

- Run launchpad, credentials, and agent workflows again to harden the setup
- Configure additional landing zones using the Azure Landing Zone Pipelines workflow
- Set up monitoring and alerting for the deployed infrastructure

## Workflow Dispatch

All workflows are configured for manual dispatch (`workflow_dispatch`) and can be triggered from the GitHub Actions tab in your repository. Select the desired workflow, choose your parameters, and run the workflow.

## Customization

> **Note**: GitHub workflows provided in this solution accelerator are provided as-is and must be customized to the customer's needs. Review and modify the workflows according to your specific requirements, security policies, and organizational standards.

## Troubleshooting

### Common Issues

1. **Authentication Failures**: Ensure federated identity credentials are properly configured
2. **Permission Errors**: Verify the service principal has the required Azure permissions
3. **Environment Not Found**: Create GitHub environments before running workflows
4. **Terraform State Issues**: Ensure remote state backend is properly configured

### Debug Mode

Enable debug logging by setting the `ACTIONS_STEP_DEBUG` variable to `true` in your repository settings.
