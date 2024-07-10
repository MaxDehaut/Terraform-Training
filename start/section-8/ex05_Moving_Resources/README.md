# Exercise 8.05 - Moving resources

The purpose of this exercise is to understand how to move a resource to another module

## Step 1 - Prepare the exercise

- Collect the files from exercise 4.08
- Some tidy-up is required:
  - module "application" should be removed
  - in "networking" module:
    - outputs.tf file should be removed
    - in main.tf file, keep the "azurerm_virtual_network" resource only
  - in "root" module:
  - adjust all the .tf files accordinly

## Step 2 - Execute the script

## Step 3 - Moving resource

- List the current state(s)
- Move the resource group to the "networking" module
- List the current state(s)
- Generate the plan

## Step 4 - Execute the script

- Execute the script
