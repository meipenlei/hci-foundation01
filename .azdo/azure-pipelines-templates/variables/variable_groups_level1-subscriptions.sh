#!/bin/bash

# main-script.sh
# Source the variables file
source /tf/caf/.azdo/azure-pipelines-templates/variables/secure.sh

# Create a variable group.
variableGroupName="level1-subscriptions"

variableGroupId=$(az pipelines variable-group create --name "$variableGroupName" --authorize true --variables \
    AGENT_POOL=ph_prefix-level0-agent1 \
    ARM_USE_MSI=true \
    CONFIGPATH=configuration/level1/subscriptions \
    KEYVAULTURL=https://ph_prefix-kv-idl0.vault.azure.net/ \
    LANDINGZONEPATH=landingzones/caf_solution \
    LEVEL=level1 \
    PLAN=subscriptions \
    TARGETSUB=ph_management_subscription_id \
    TFSTATE=subscriptions \
    TFSTATESUB=$TFSTATESUB \
    --query id)
