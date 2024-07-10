#!/bin/bash

# 1 - Create resource group
az group create --name "rgTfTraining" --location westeurope

# 2 - Create storage account
az storage account create --resource-group "rgTfTraining" --name "satftraining012345" --sku Standard_LRS --encryption-services blob

# 3 - Create blob container
az storage container create --name "tfstate" --account-name "satftraining012345"

# 4 - Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group "rgTfTraining" --account-name "satftraining012345" --query [0].value -o tsv)

# 5 - Create a key vault key
az keyvault create -g "rgTfTraining" -l westeurope --name "keyTfTraining"

## List account keys
az storage account keys list --resource-group "rgTfTraining" --account-name "keyTfTraining" --query [0].value -o tsv

# Create vault key
az keyvault secret set --name tfstate-storage-key --value ... --vault-name "keyTfTraining"

echo $ACCOUNT_KEY