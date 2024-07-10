# Exercise 4.05 - Application module

## Step 1 - Create the structure

- In the root folder,
  - Collect the files from previous exercise (ex 4.04)
  - Create a folder "application" within the "modules" folder
- In the "database" folder,
  - Create 3 files: main.tf, outputs.tf and variables.tf

## Step 2 - Variables

- The variables are the same as those defined in "root". Location and CostAlloc can be removed though.
- An additional variable representing the resource group should be declared. Its type is 'any'

## Step 3 - Resourcs

- Create an Application Service Plan (azurerm_app_service_plan) resource with the following configuration

  Attribute                    | Value         | Comment
  ---------------------------- | ------------- | -------
  name                         | "asp-"+suffix | from root module
  location                     | ?             | from root module (resource group)
  resource_group_name          | ?             | from root module (resource group)

- The Application Service Plan contains an "sku" structure with the following configuration

  Attribute | Value   | Comment
  --------- | ------- | -------
  tier      | "Basic" |
  size      | "B1"    |

- Create an Application Service () resource with the following configuration

  Attribute                    | Value         | Comment
  ---------------------------- | ------------- | -------
  name                         | "asp-"+suffix | from root module
  location                     | ?             | from root module (resource group)
  resource_group_name          | ?             | from root module (resource group)
  app_service_plan_id          | ?             | from Application Service Plan

- The Application Service Plan contains an "site_config" structure with the following configuration

  Attribute                | Value    | Comment
  ------------------------ | -------- | -------
  dotnet_framework_version | "v4.0"   |
  remote_debugging_enabled | "Basic"  |
  remote_debugging_version | "VS2019" |

## Step 4 - Output file

- The first output value should return the name of the application service
- The second output value should return the default hostname of the application service

## Step 5 - Edit the root files

- The "root" should be updated accordingly
  - The source attribute should reference the "application" folder only
  - Any other attributes/variables used in the "application" module should be set

## Step 6 - Execute the deployment

## Step 7 - Output the values using terraform output

- !!! Don't forget to destroy !!!
