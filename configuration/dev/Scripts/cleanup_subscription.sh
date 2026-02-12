#!/bin/bash
## manual usage from the root of the repository:
## az login --tenant <TENANT_ID> [--use-device-code]
## az account set --subscription f371e124-4b06-46ea-9d63-f51d48d76e64
## bash configuration/dev/Scripts/cleanup_subscription.sh

# Determine prefix
prefix=$(cat configuration/level0/launchpad/global_settings.tfvars | grep "prefix" | tail -n1 | awk '{print $3}' | sed 's/"//g')
echo "prefix: $prefix"

## Delete launchpad resource groups
for name in $(az group list --query "[?starts_with(name, '$prefix-')].name" | jq -r .[]); do
    echo "deleting rg $name"
    az group delete --name $name --no-wait --yes
done

sleep 5

## Purge Keyvaults
for name in $(az keyvault list --query "[?starts_with(name, '$prefix-')].name" | jq -r .[]); do
    echo "purging keyvault $name"
    az keyvault purge --name $name --no-wait
done
for name in $(az keyvault list-deleted --query "[?starts_with(name, '$prefix-')].name" | jq -r .[]); do
    echo "purging keyvault $name"
    az keyvault purge --name $name --no-wait
done

## Delete groups
for id in $(az ad group list --filter "startswith(displayName, '$prefix-')" | jq -r .[].id); do
    echo "deleting group $id"
    az ad group delete --group $id
done

## Delete applications
for id in $(az ad app list --filter "startswith(displayName, '$prefix-')" | jq -r .[].appId); do
    echo "deleting app/serviceprincipal $id"
    az ad app delete --id $id
done

## Delete 'Identity not found' role assignments
for id in $(az role assignment list --query "[?principalName==''].id" | jq -r .[]); do
    echo "delete 'Identity not found' role assignments $id"
    az role assignment delete --ids $id
done
