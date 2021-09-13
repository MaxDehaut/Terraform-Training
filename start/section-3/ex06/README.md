# Exercise 3.06 - Count

## Step 1 - Prepare the environment

- Collect the solution file from exercise 3.05

## Step 2 - Apply conditional expression

- Add a variable "nbrApp" which will store the number of applications (app service) to be deployed
- Add an "azurerm_app_service_plan" resource
  - SKU details should be standard tier and S1 size
- Add an "azurerm_app_service" resource
  - The name of the app service should include the value of the counter (nbrApp)

## Step 3 - Execute the deployment

- !!! Don't forget to destroy !!!
