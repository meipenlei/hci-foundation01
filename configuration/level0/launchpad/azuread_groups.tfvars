azuread_groups = {
  caf_platform_maintainers = {
    name                   = "platform-maintainers"
    description            = "High privileged group to run all CAF deployments from vscode. Can be used to bootstrap or troubleshoot deployments."
    owners                 = ["6455e5c3-d602-41cd-84a3-e903e45fa536"]
    prevent_duplicate_name = true
  }
  caf_platform_contributors = {
    name                   = "platform-contributors"
    description            = "Can execute terraform plans for all levels. They can test platform improvements and propose PR."
    owners                 = ["6455e5c3-d602-41cd-84a3-e903e45fa536"]
    prevent_duplicate_name = true
  }
  caf_platform_readers = {
    name                   = "platform-readers"
    description            = "Can only read terraform plans for all levels. They can inform and verify platform improvements and support PR."
    owners                 = ["6455e5c3-d602-41cd-84a3-e903e45fa536"]
    prevent_duplicate_name = true
  }
  level0 = {
    name        = "level0"
    description = "High privileged group next to platform maintainers. Service Principal with higer permissions are there"
    members = {
      azuread_service_principal_keys = ["level0"]
    }
    owners                 = ["6455e5c3-d602-41cd-84a3-e903e45fa536"]
    prevent_duplicate_name = true
  }
  alz = {
    name        = "alz"
    description = "(Level1) The Service Principal which deploys the Enterprise Scale Model"
    members = {
      azuread_service_principal_keys = ["alz"]
    }
    owners                 = ["6455e5c3-d602-41cd-84a3-e903e45fa536"]
    prevent_duplicate_name = true
  }
  identity = {
    name        = "identity"
    description = "(Level1) to deploy identity relevant resources, like credentials keyvaults"
    members = {
      azuread_service_principal_keys = ["identity"]
    }
    owners                 = ["6455e5c3-d602-41cd-84a3-e903e45fa536"]
    prevent_duplicate_name = true
  }
  management = {
    name        = "management"
    description = "(Level1) The Service Principal which deploys monitoring ressources, like Log Analytics"
    members = {
      azuread_service_principal_keys = ["management"]
    }
    owners                 = ["6455e5c3-d602-41cd-84a3-e903e45fa536"]
    prevent_duplicate_name = true
  }
  connectivity = {
    name        = "connectivity"
    description = "(Level2) The Service Principal which deploys the network resources, like Hub n Spoke"
    members = {
      azuread_service_principal_keys = ["connectivity"]
    }
    owners                 = ["6455e5c3-d602-41cd-84a3-e903e45fa536"]
    prevent_duplicate_name = true
  }
  subscription_creation_platform = {
    name        = "subscription_creation_platform"
    description = "(Level3) The Service Principal which deploys platforms like VMs, AKS or databases"
    members = {
      azuread_service_principal_keys = ["subscription_creation_platform"]
    }
    owners                 = ["6455e5c3-d602-41cd-84a3-e903e45fa536"]
    prevent_duplicate_name = true
  }
  subscription_creation_landingzones = {
    name        = "subscription_creation_landingzones"
    description = "(Level4) The Service Principal which deploys ent to end resources like Containers or Applications"
    members = {
      azuread_service_principal_keys = ["subscription_creation_landingzones"]
    }
    owners                 = ["6455e5c3-d602-41cd-84a3-e903e45fa536"]
    prevent_duplicate_name = true
  }
  gitops = {
    name        = "gitops"
    description = "Higher privileged group for future gitops tasks."
    members = {
      azuread_service_principal_keys = ["gitops"]
    }
    owners                 = ["6455e5c3-d602-41cd-84a3-e903e45fa536"]
    prevent_duplicate_name = true
  }
}
