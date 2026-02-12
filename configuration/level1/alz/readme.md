# Azure Landing Zones - Enterprise Scale Configuration

This directory contains the Enterprise Scale (ES) configuration for Azure Landing Zones deployment at Level 1, implementing Microsoft's Cloud Adoption Framework Enterprise Scale reference architecture.

## 🏗️ Management Group Hierarchy

The Enterprise Scale configuration deploys a comprehensive management group structure:

```
ph_optional_root_parent_id (Root Parent)
└── ph_prefix (ph_DevOpsOrg Any SubRoot)
    ├── ph_prefix-platform
    │   ├── ph_prefix-connectivity
    │   ├── ph_prefix-identity
    │   └── ph_prefix-management
    ├── ph_prefix-landing-zones
    │   ├── ph_prefix-corp
    │   ├── ph_prefix-online
    │   └── ph_prefix-custom
    ├── ph_prefix-sandboxes
    └── ph_prefix-decommissioned
```

## 📋 Configuration Structure

### Core Configuration Files

| File | Purpose |
|------|---------|
| `enterprise_scale.tfvars` | Main ES configuration with root settings |
| `custom_landing_zones.tfvars` | Custom landing zone definitions |
| `archetype_config_overrides.tfvars` | Archetype customizations |
| `subscription_id_overrides.tfvars` | Subscription assignments |
| `landingzone.tfvars` | Landing zone deployment settings |

### Library Structure (`lib/`)

```
lib/
├── archetype_definitions/     # Management group archetypes
├── policy_assignments/        # Azure Policy assignments
├── policy_definitions/        # Custom policy definitions
├── policy_set_definitions/    # Policy initiative definitions
└── role_definitions/          # Custom RBAC role definitions
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

### Deployed Archetypes

| Archetype | Purpose | Key Policies |
|-----------|---------|--------------|
| **Root** | Organization-wide governance | ISO 27001, Security Baselines, Compliance |
| **Platform** | Platform services governance | Resource management, networking |
| **Landing Zones** | Workload governance | Application-specific policies |
| **Corp** | Corporate workloads | Enhanced security, connectivity |
| **Online** | Internet-facing workloads | Public endpoint management |
| **Custom** | Specialized workloads | Custom compliance requirements |
| **Sandboxes** | Development/testing | Relaxed policies for innovation |

### Key Policy Assignments

#### Root Level Policies
- **Security Baselines**: Linux, Windows, Microsoft services
- **Compliance**: ISO 27001:2013 implementation
- **Monitoring**: Azure Activity logs, diagnostic settings
- **Network Security**: VNet flow logs, NSG/UDR enforcement
- **Resource Governance**: Location restrictions, tagging compliance
- **Microsoft Defender**: Security configuration deployment

#### Custom Policy Assignments (Brownfield-Optimized)
- `CAF-Deny-Subnet-No-Nsg` → **Audit mode**: Monitor NSG compliance without blocking
- `CAF-Deny-Subnet-No-Udr` → **Audit mode**: Track UDR usage for gradual adoption
- `CAF-Deny-CompliantTag` → **DoNotEnforce**: Allow existing resources, enforce on new ones
- `CAF-Deploy-Diag-Logs` → **Audit mode**: Identify resources needing diagnostic settings
- `CAF-Deploy-MDFC-Config` → **Progressive deployment**: Microsoft Defender for Cloud setup

> **🎯 Brownfield Benefit**: Existing environments can be onboarded without immediate disruption, while new resources follow compliance standards.

## 🔧 Current Configuration

### Root Configuration
- **Root ID**: `ph_prefix`
- **Display Name**: `ph_DevOpsOrg Any SubRoot`
- **Parent ID**: `ph_optional_root_parent_id`
- **Library Path**: `/tf/caf/configuration/level1/alz/es/lib`

### Enabled Landing Zones
- ✅ **Core Landing Zones**: Foundation platform services
- ✅ **Corp Landing Zones**: Corporate workload environments
- ✅ **Online Landing Zones**: Internet-facing applications
- ❌ **SAP Landing Zones**: Disabled (not required)

### Custom Landing Zone
- **Name**: `ph_prefix-custom`
- **Parent**: `ph_prefix-landing_zones`
- **Subscription**: `ph_app001_subscription_id`
- **Purpose**: Specialized workload requirements

## 📊 Compliance & Monitoring

### Implemented Standards
- **ISO 27001:2013** - Information security management
- **Azure Security Benchmark** - Microsoft security baseline
- **Azure Well-Architected Framework** - Operational excellence

### Monitoring Features
- Azure Activity Log collection
- Resource diagnostic settings
- VNet flow logs (multiple regions)
- Microsoft Defender for Cloud integration
- Security baseline monitoring

## 🚀 Deployment

This configuration is deployed as part of Level 1 CAF implementation:

```bash
# Deploy via Rover
/tf/rover/rover.sh \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/level1/alz \
  -tfstate alz_level1.tfstate \
  -env ph_environment \
  -level level1 \
  -a plan
```

## 📝 Customization

### Migration Path: Audit to Enforce

For customers ready to move from brownfield to strict governance:

1. **Assessment Phase**: Review audit findings from current policies
2. **Remediation Phase**: Fix non-compliant resources identified by audit policies
3. **Enforcement Phase**: Gradually change policies from "Audit" to "Deny" mode
4. **Validation Phase**: Monitor enforcement impact and adjust as needed

### Configuration Customization

To customize the Enterprise Scale deployment:

1. **Modify archetypes**: Update files in `lib/archetype_definitions/`
2. **Add custom policies**: Create new assignments in `lib/policy_assignments/`
3. **Override configurations**: Update `archetype_config_overrides.tfvars`
4. **Custom landing zones**: Modify `custom_landing_zones.tfvars`

## 🔗 References

- [Enterprise Scale Documentation](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/enterprise-scale/)
- [Azure Landing Zones](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/)
- [CAF Terraform Module](https://registry.terraform.io/modules/Azure/caf-enterprise-scale/azurerm/latest)