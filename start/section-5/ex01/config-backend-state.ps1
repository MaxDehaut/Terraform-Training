
$RESOURCE_GROUP_NAME='rgTfTraining'
$STORAGE_ACCOUNT_NAME="satftraining$(Get-Random)"
$CONTAINER_NAME='sctftraining'

# Resource Group
New-AzResourceGroup -Name $RESOURCE_GROUP_NAME -Location westeurope

# Storage Account
$storageAccount = New-AzStorageAccount -ResourceGroupName $RESOURCE_GROUP_NAME -Name $STORAGE_ACCOUNT_NAME -SkuName Standard_LRS -Location westeurope -AllowBlobPublicAccess $true

# Storage Container
New-AzStorageContainer -Name $CONTAINER_NAME -Context $storageAccount.context -Permission blob

# Collect the account key
$ACCOUNT_KEY=(Get-AzStorageAccountKey -ResourceGroupName $RESOURCE_GROUP_NAME -Name $STORAGE_ACCOUNT_NAME)[0].value
$env:ARM_ACCESS_KEY=$ACCOUNT_KEY

# Push to Keyvault via
# export ARM_ACCESS_KEY=$(az keyvault secret show --name terraform-backend-key --vault-name myKeyVault --query value -o tsv)

