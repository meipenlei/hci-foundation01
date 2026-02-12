#!/bin/bash

# main-script.sh
# Source the variables file
source /tf/caf/.azdo/azure-pipelines-templates/variables/secure.sh

# Create a variable group.
variableGroupName="release-global"

variableGroupId=$(az pipelines variable-group create --name "$variableGroupName" --authorize true --variables \
    ENVIRONMENT=$ENVIRONMENT \
    MSI_RESOURCE_ID=$MSI_RESOURCE_ID \
    ROVER_IMAGE=$ROVERVERSION \
    --query id)
