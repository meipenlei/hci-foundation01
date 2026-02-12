#!/bin/bash

# main-script.sh
# Source the variables file
source /tf/caf/.azdo/azure-pipelines-templates/variables/secure.sh

# Create a variable group.
variableGroupName="level1-alz_es"

variableGroupId=$(az pipelines variable-group create --name "$variableGroupName" --authorize true --variables \
    AGENT_POOL=ph_prefix-level0-agent1 \
    ARM_USE_MSI=true \
    CONFIGPATH=configuration/level1/alz/es \
    KEYVAULTURL=https://ph_prefix-kv-es.vault.azure.net/ \
    LANDINGZONEPATH=landingzones/caf_solution/add-ons/caf_eslz \
    LEVEL=level1 \
    PLAN=alz_es \
    TARGETSUB=ph_management_subscription_id \
    TFSTATE=alz_es \
    TFSTATESUB=$TFSTATESUB \
    --query id)
