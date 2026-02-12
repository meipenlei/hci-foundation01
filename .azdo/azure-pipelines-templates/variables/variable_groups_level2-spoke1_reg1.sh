#!/bin/bash

# main-script.sh
# Source the variables file
source /tf/caf/.azdo/azure-pipelines-templates/variables/secure.sh

# Create a variable group.
variableGroupName="level2-spoke1_reg1"

variableGroupId=$(az pipelines variable-group create --name "$variableGroupName" --authorize true --variables \
    AGENT_POOL=ph_prefix-level0-agent1 \
    ARM_USE_MSI=true \
    CONFIGPATH=configuration/level2/connectivity/spoke1_reg1 \
    KEYVAULTURL=https://ph_prefix-kv-co.vault.azure.net/ \
    LANDINGZONEPATH=landingzones/caf_solution \
    LEVEL=level2 \
    PLAN=connectivity_spoke1_reg1 \
    TARGETSUB=ph_identity_subscription_id \
    TFSTATE=connectivity_spoke1_reg1 \
    TFSTATESUB=$TFSTATESUB \
    --query id)
