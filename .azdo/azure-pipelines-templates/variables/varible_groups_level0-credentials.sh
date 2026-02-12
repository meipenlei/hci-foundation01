#!/bin/bash

# main-script.sh
# Source the variables file
source /tf/caf/.azdo/azure-pipelines-templates/variables/secure.sh

# Create a variable group.
variableGroupName="level0-credentials"

variableGroupId=$(az pipelines variable-group create --name "$variableGroupName" --authorize true --variables \
    AGENT_POOL=ph_prefix-level0-agent1 \
    ARM_USE_MSI=true \
    CONFIGPATH=configuration/level0/credentials \
    KEYVAULTURL=https://ph_prefix-kv-idl0.vault.azure.net/ \
    LANDINGZONEPATH=landingzones/caf_solution \
    LEVEL=level0 \
    PLAN=launchpad_credentials \
    TARGETSUB=ph_identity_subscription_id \
    TFSTATE=launchpad_credentials \
    TFSTATESUB=$TFSTATESUB \
    --query id)
