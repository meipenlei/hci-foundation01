#!/bin/bash

# main-script.sh
# Source the variables file
source /tf/caf/.azdo/azure-pipelines-templates/variables/secure.sh

# Create a variable group.
variableGroupName="level0-agent"

variableGroupId=$(az pipelines variable-group create --name "$variableGroupName" --authorize true --variables \
    AGENT_POOL=hci01-level0-agent1 \
    ARM_USE_MSI=true \
    CONFIGPATH=configuration/level0/agent \
    KEYVAULTURL=https://hci01-kv-idl0.vault.azure.net/ \
    LANDINGZONEPATH=landingzones/caf_solution/add-ons/azure_devops_agent \
    LEVEL=level0 \
    PLAN=agent_level0 \
    TARGETSUB=f371e124-4b06-46ea-9d63-f51d48d76e64 \
    TFSTATE=agent_level0 \
    TFSTATESUB=$TFSTATESUB \
    --query id)
