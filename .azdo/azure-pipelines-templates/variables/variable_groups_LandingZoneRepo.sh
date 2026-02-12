#!/bin/bash

# main-script.sh
# Source the variables file
source /tf/caf/.azdo/azure-pipelines-templates/variables/secure.sh

# Create a variable group.
variableGroupName="LandingZoneRepo"
az config set extension.dynamic_install_allow_preview=true
variableGroupId=$(az pipelines variable-group create --name "$variableGroupName" --authorize true --variables \
    AZDO_PAT="$AZDO_PAT" \
    --query id)
