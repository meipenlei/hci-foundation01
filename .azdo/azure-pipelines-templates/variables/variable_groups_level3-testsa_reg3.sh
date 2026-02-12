#!/bin/bash

# main-script.sh
# Source the variables file
source /tf/caf/.azdo/azure-pipelines-templates/variables/secure.sh

# Create a variable group.
variableGroupName="level3-testsa_reg3"

variableGroupId=$(az pipelines variable-group create --name "$variableGroupName" --authorize true --variables \
    AGENT_POOL=ph_prefix-level0-agent1 \
    ARM_USE_MSI=true \
    CONFIGPATH=configuration/level3/testsa_reg3 \
    KEYVAULTURL=https://ph_prefix-kv-scp.vault.azure.net/ \
    LANDINGZONEPATH=landingzones/caf_solution \
    LEVEL=level3 \
    PLAN=testsa_reg3 \
    TARGETSUB=ph_app001_subscription_id \
    TFSTATE=testsa_reg3 \
    TFSTATESUB=$TFSTATESUB \
    --query id)
