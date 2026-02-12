#!/bin/bash

# main-script.sh
# Source the variables file
source /tf/caf/.azdo/azure-pipelines-templates/variables/secure.sh

# Create a variable group.
variableGroupName="level2-dc2_reg2"

variableGroupId=$(az pipelines variable-group create --name "$variableGroupName" --authorize true --variables \
    AGENT_POOL=ph_prefix-level0-agent1 \
    ARM_USE_MSI=true \
    CONFIGPATH=configuration/level2/identity/dc2_reg2 \
    KEYVAULTURL=https://ph_prefix-kv-id.vault.azure.net/ \
    LANDINGZONEPATH=landingzones/caf_solution \
    LEVEL=level2 \
    PLAN=dc2_reg2 \
    TARGETSUB=ph_identity_subscription_id \
    TFSTATE=dc2_reg2 \
    TFSTATESUB=$TFSTATESUB \
    --query id)
