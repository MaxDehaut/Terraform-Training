# Exercise 4.02 - Networking module

## Step 1 - Create the structure

- In the root folder,
  - Collect the files from previous exercise (ex 4.01)
  - Create a folder "networking" within the "modules" folder
- In the "networking" folder,
  - Create 3 files: main.tf, outputs.tf and variables.tf

## Step 2 - Edit the networking files

- The variables are the same as those defined in "root"
- Several resources must be created
  - A resource group

  Attribute | Value        | Comment
  --------- | ------------ | -------
  name      | "rg-"+suffix | from root module
  location  | ?            | from root module

  - A virtual network (azurerm_virtual_network).

  Attribute           | Value           | Comment
  ------------------- | --------------- | -------
  address_space       | ["10.0.0.0/16"] | -
  location            | ?               | from resource group
  name                | "vnt-"+suffix   | from root module
  resource group name | ?               | from resource group

  - A subnet (azurerm_subnet)

  Attribute            | Value           | Comment
  -------------------- | --------------- | -------
  address_prefixes     | ["10.0.1.0/24"] | -
  name                 | "subnt-"+suffix | from root module
  resource group name  | ?               | from resource group
  virtual network name | ?               | from virtual network name

## Step 3 - Output file

- The output value is the resource group that has been created

## Step 4 - Edit the root files

- The "root" should be updated accordingly
  - The source attribute should reference the "networking" folder only
  - Any other attributes/variables used in the "networking" module should be set

## Step 5 - Execute the deployment

- !!! Don't forget to destroy !!!
