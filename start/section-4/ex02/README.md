# Exercise 4.02 - Networking module

## Step 1 - Create the structure

- In the root folder,
  - Create a folder "networking"
- In the "networking" folder,
  - Create 3 files: main.tf, outputs.tf and variables.tf

## Step 2 - Edit the networking files

- The variables are the same as those defined in "root"
- The output value is the resource group that will be created (see below)
- Several resources must be created
  - A resource group
  - A virtual network (azurerm_virtual_network). Only the name, the resource group, the location and the address space are required
  - A subnet (azurerm_subnet). Only the name, the resource group, the vnet name and the address prefixes are required

## Step 3 - Edit the root files

- The "networking" module should be updated accordingly
  - The source attribute should reference the "networking" folder
  - Any other attributes used in the "networking" module should be set

## Step 4 - Execute the deployment
