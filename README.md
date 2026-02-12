# Cloud Adoption Framework Landing Zones for Terraform - Enterprise Platform - CloudEnabler for Azure Foundation

This repository provides a comprehensive implementation of Microsoft [Cloud Adoption Framework for Azure](https://aka.ms/caf) using Terraform, designed for enterprise-scale deployments with dual CI/CD platform support.

## 🏗️ Architecture Overview

This implementation follows a **multi-level deployment strategy** that progressively builds your Azure environment:

- **Level 0**: Bootstrap & Self-Hosted Agents/Runners (Launchpad, Credentials, Self-hosted Runners)
- **Level 1**: Azure Foundation (Governance, Monitoring, Enterprise Scale Landing Zones)
- **Level 2**: Shared Services (Connectivity, Identity)
- **Level 3**: Platform Services (Compute, Databases, AKS)
- **Level 4**: Application Landing Zones

## 🚀 Platform Features

### Dual CI/CD Support

- **GitHub Actions** - Complete workflow automation in `.github/`
- **Azure DevOps** - Enterprise pipeline support in `.azdo/`
- **Rover Container** - Consistent execution environment across platforms

### Container-Based Execution

- **Rover Image**: `ph_rover_version`
- Includes Terraform, Azure CLI, and CAF-specific tooling
- Ensures consistent deployments across environments

## 📁 Repository Structure

```bash
├── .github/                  # GitHub Actions workflows & custom actions
│   ├── workflows/            # CI/CD workflows (bootstrap, deployment)
│   └── actions/              # Reusable composite actions
├── .azdo/                    # Azure DevOps pipelines & configurations
├── configuration/            # Terraform variable files by level
│   ├── level0/               # Bootstrap configurations
│   ├── level1/               # Foundation configurations
│   ├── level2-4/             # Platform & application configurations
├── landingzones/             # Terraform modules & CAF landing zones
│   ├── caf_launchpad/        # Bootstrap infrastructure
│   ├── caf_solution/         # Core CAF modules
│   └── add-ons/              # Enterprise Scale & extensions
└── rover/                    # Rover container build components
```

### Azure Verified Modules (AVM) Integration

- **Microsoft-certified modules** - Enhanced with Azure Verified Modules for production-ready components
- **Managed DevOps Pools** - First AVM implementation for scalable CI/CD infrastructure
- **Best practices built-in** - Combines CAF governance with AVM quality standards

```bash
├── landingzones/              # Terraform modules & CAF landing zones
│   ├── caf_launchpad/         # Bootstrap infrastructure
│   ├── caf_solution/          # Core CAF modules
│   │   └── add-ons/           # Enterprise Scale & extensions
│   │       └── managed_agent/ # 🆕 Azure Verified Module for Managed DevOps Pool
└── rover/                     # Rover container build components
```

## 🛡️ Security & Governance Framework

### Brownfield & Greenfield Support

This Enterprise Scale implementation is designed to support **both greenfield and brownfield deployments**:

#### 🌱 **Greenfield Approach**

- New Azure environments with strict governance from day one
- Full policy enforcement for optimal security posture

#### 🏭 **Brownfield Approach** (Current Configuration)

- **Audit-first strategy**: Many policies configured as "Audit" instead of "Deny"
- **DoNotEnforce settings**: Allows gradual compliance adoption
- **Existing workload compatibility**: Prevents disruption of running services
- **Progressive governance**: Enables step-by-step compliance improvement

> **💡 Strategic Advantage**: This approach reduces customer concerns about policy disruption and enables smooth migration of existing workloads while gradually improving compliance posture.

## 🛠️ Quick Start

### Prerequisites

- Azure subscription with appropriate permissions (optimally 4 different subscriptions)
- GitHub repository or Azure DevOps project
- Docker environment for Rover container (e.g. Rancher Desktop)

### GitHub Actions Setup

1. Configure repository secrets and variables
2. Run environment creation workflow:

   ```bash
   gh workflow run create-environments.yml
   ```

3. Execute bootstrap deployment:

   ```bash
   gh workflow run bootstrap-1.yml and bootstrap-2.yml
   ```

For detailed instructions, see the [Run from GitHub Overview](.github/instructions.md).

### Azure DevOps Setup

1. Import pipelines from `.azdo/` directory
2. Configure service connections and variable groups
3. Run bootstrap pipelines

For detailed instructions, see the [Run from Azure DevOps Overview](.azdo/azure-pipelines-templates/README.md).

## 🔧 Configuration

### Required Variables

For detailed variable definitions, see the [Variable Overview](./configuration/README.md).

## 📚 Documentation

Refer to the comprehensive CAF Terraform documentation:

- [Official Documentation](https://aka.ms/caf/terraform)
- [GitHub Pages](https://aztfmod.github.io/documentation/)

![CloudEnabler Documentation](./media/img/logo.png)

## 🔄 Deployment Workflow

1. **Bootstrap** - Deploy foundational infrastructure (Level 0)
2. **Foundation** - Establish core platform services (Level 1)
3. **Connectivity** - Configure networking and security (Level 2)
4. **Platform Services** - Deploy shared services (Level 3)
5. **Applications** - Deploy application landing zones (Level 4)

## 🛡️ Security & Compliance

- Follows Microsoft Cloud Adoption Framework best practices
- Implements Azure Well-Architected Framework principles
- Supports enterprise governance and compliance requirements
- Uses managed identities and Azure Key Vault for secure credential management

## 🤝 Community & Support

Feel free to open an issue for features, bugs, or submit pull requests.

- **Email**: markus.jacob at devoteam dot com

## 📄 Contributing

This project welcomes contributions and suggestions. Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit [Opensource Microsoft](https://cla.opensource.microsoft.com).

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## ™️ Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft
trademarks or logos is subject to and must follow
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.

## 📄 Licensing & Attribution

This framework combines:

- **Original work**: Custom configurations, pipelines, and documentation (Your License)
- **Microsoft technologies**: Azure services, CAF methodology (Microsoft trademarks)
- **Open source modules**: Terraform providers and modules (Various OSS licenses)
- **Third-party tools**: As referenced in dependencies

All third-party components retain their original licenses and attributions
