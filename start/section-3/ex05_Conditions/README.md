# Exercise 3.05 - Conditional expression

## Step 1 - Prepare the environment

- Collect the solution file from exercise 3.02

## Step 2 - Apply conditional expression

- Only the "Resource Group" resource will be updated.
- The name of the resource group will vary depending on the environment.
  - If the variable "environment" is "Production" then the name should be in in uppercase, 
  - If not, it should be in lowercase

```terraform
{
  name = (var.environment == "Production") ? upper(«application name») : lower(«application name»)
  location = "${var.location}"
}
```

## Step 3 - Execute the deployment

- !!! Don't forget to destroy !!!
