#!/bin/bash

# main-script.sh
# Source the variables file
source /tf/caf/.azdo/azure-pipelines-templates/variables/secure.sh

# Create a variable group.
variableGroupName="level1-alz_es"

variableGroupId=$(az pipelines variable-group create --name "$variableGroupName" --authorize true --variables \
    AGENT_POOL=hci01-level0-agent1 \
    ARM_USE_MSI=true \
    CONFIGPATH=configuration/level1/alz/es \
    KEYVAULTURL=https://hci01-kv-es.vault.azure.net/ \
    LANDINGZONEPATH=landingzones/caf_solution/add-ons/caf_eslz \
    LEVEL=level1 \
    PLAN=alz_es \
    TARGETSUB=f371e124-4b06-46ea-9d63-f51d48d76e64 \
    TFSTATE=alz_es \
    TFSTATESUB=$TFSTATESUB \
    --query id)
