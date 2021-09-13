# Exercise 3.01 - Azure Resource Group Name

## Step 1 - Prepare the environment

- Collect the solution file from exercise 2.04
- Add 3 variables to store:
  - The application name
  - The environment
  - The location (region)

## Step 2 - Create a local resource name

- Create a structure/element "locals"
- Add an attribute "resource_name" which will concatenate the first 2 variables declared previously

## Step 3 - Update the resource group

- Update the name of the resource group to concatenate "rg-" & the resource name of the "locals" structure/element

## Step 4 - Execute the deployment

- !!! Don't forget to destroy !!!
