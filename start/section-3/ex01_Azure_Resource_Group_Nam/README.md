# Exercise 3.01 - Azure Resource Group Name

## Step 1 - Prepare the environment

- Collect the solution file from exercise 2.03

## Step 2 - Prepare the environment

- Add 3 variable blocks to store:
  - The application name (string), described as "The name of the application"
  - The environment (string), described as "The name of the environment"
  - The location (string), described as "The name of the Azure region"

## Step 3 - Create a local resource name

- Create a structure/element "locals" and add the following attribute:

  Attribute     | Value           | Comment
  ------------- | --------------- | -------
  resource_name | "${...}-${...}" | concatenate the application name variable and the environment variable

- As a reminder, within a string, a variable is invoked through "${var.«app_name»}"

## Step 4 - Update the resource group

- Update the name of the resource group to concatenate "rg-" & the resource name of the "locals" structure/element

## Step 4 - Execute the deployment

- !!! Don't forget to destroy !!!
