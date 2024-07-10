#region Declarations

$SUFFIX = 'DevOps'
$LOCATION = 'westeurope'
$RESOURCE_GROUP_NAME = 'rg' + $SUFFIX
$STORAGE_ACCOUNT_NAME = 'sa' + $SUFFIX.ToLower() + $(Get-Random)
$CONTAINER_NAME = 'sc' + $SUFFIX.ToLower()

#endregion


#region Create Azure objects

# Resource Group
New-AzResourceGroup -Name $RESOURCE_GROUP_NAME -Location $LOCATION

# Storage Account
$storageAccount = New-AzStorageAccount -ResourceGroupName $RESOURCE_GROUP_NAME `
    -Name $STORAGE_ACCOUNT_NAME `
    -SkuName Standard_LRS `
    -Location $LOCATION `
    -AllowBlobPublicAccess $true

# Activate Version ControlrgDevOps
Update-AzStorageBlobServiceProperty -StorageAccountName $STORAGE_ACCOUNT_NAME `
    -ResourceGroupName $RESOURCE_GROUP_NAME `
    -IsVersioningEnabled $true

# Storage Container
New-AzStorageContainer -Name $CONTAINER_NAME `
    -Context $storageAccount.context `
    -Permission blob

# Collect Account Key
$ACCOUNT_KEY = (Get-AzStorageAccountKey -ResourceGroupName $RESOURCE_GROUP_NAME -Name $STORAGE_ACCOUNT_NAME)[0].value

Write-Output 'Account key: ' + $ACCOUNT_KEY

#$env:ARM_ACCESS_KEY = $ACCOUNT_KEY

#endregion


#region Storing Config Details

# Declare tfvars file
$outputFile = (Get-Location).Path + '/terraform.tfvars'

## Delete (if) existing file
if (Test-Path $outputFile) {
    Remove-Item $outputFile
}

# Create tfvars file
New-Item  $outputFile -ItemType File

# Writing file content
try {
    $fileWriter = [System.IO.StreamWriter] $outputFile
    $fileWriter.WriteLine('resource_group_name = "' + $RESOURCE_GROUP_NAME + '"')
    $fileWriter.WriteLine('storage_account_name = "' + $STORAGE_ACCOUNT_NAME + '"')
    $fileWriter.WriteLine('container_name = "' + $CONTAINER_NAME + '"')
    $fileWriter.WriteLine('location = "' + $LOCATION + '"')
    $fileWriter.Close()
}
finally {
    
}
#endregion
