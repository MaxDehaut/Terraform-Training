# Exercise 3.07 - For expressions

## Step 1 - Prepare the environment

- Create an empty main.tf file
- Populate with the typical Azure elements: provider, terraform

## Step 2 - Add a data element

- Create a data element ("azurerm_resources") representing a list of Azure resources of the same type (ie Storage Accounts)
- Add the attribute "type" and its value
  - Network Security Groups: Microsoft.Network/networkSecurityGroups
  - Storage Account: Microsoft.Storage/storageAccounts

- Add the attribute "resource_group_name" and its value. This is the resource group you would like to collect the list of resources from.

## Step 3 - Output the result

- The idea is to return for each element stored in the data element its content.
- The return value should set the output value
- The return value should return a map of the name of the sub-resource and its content
- These resources can be accessed via the attribute "resources"

- Syntax:
  - value = { ___ _ __ «data_element».resources . __.____ => _ }

## Step 4 - Execute the deployment

- Generate the plan and apply
- Is it worth destroying ?
