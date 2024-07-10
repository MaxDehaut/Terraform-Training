# Exercise 3.02 - Validation rule

## Step 1 - Prepare the environment

- Collect the solution file from exercise 3.01

## Step 2 - Create a validation rule

- Add a validation structure to the "location" variable
- The condition should check that the only possible values are "West Europe" or "westeurope". To do so, the "contains" function will be used.
- The error message should indicate that only "West Europe" or "westeurope" are permitted

```terraform
...
validation {
    condition     = contains(["West Europe", "westeurope"], «the location variable»)
    error_message = "«insert your error message»."
}
...
```

- Set the default value to "easteurope"


## Step 3 - Generate the plan ... if you can

- !!! Don't forget to destroy !!!
