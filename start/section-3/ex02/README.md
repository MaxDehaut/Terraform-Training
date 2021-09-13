# Exercise 3.02 - Validation rule

## Step 1 - Prepare the environment

- Collect the solution file from exercise 3.01

## Step 2 - Create a validation rule

- Add a validation structure to the "location" variable
- The condition should check that the only possible values are "westeurope" or "westeu"
  - To do so, you should consider a ("can(...)" function)[https://www.terraform.io/docs/language/functions/can.html]
  - The first argument should be the list of permitted values
  - The second argument should be the value of the variable
- The error message should indicate that only "westeurope" or "westeu" are permitted

## Step 3 - Generate the plan ... if you can
