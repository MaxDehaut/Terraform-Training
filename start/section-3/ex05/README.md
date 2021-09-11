# Exercise 3.05 - Conditional expression

## Step 1 - Prepare the environment

- Collect the solution file from exercise 3.02

## Step 2 - Apply conditional expression

- The name of the resource group will be based on the application name only
- The name of the resource group will vary depending on the environment.
  - For Production environment, the name should be in uppercase, lowercase otherwise.

- The test should evaluate the environment
  - syntax: «variable to test» [test operator] «value» ? value if true : value if false

- upper(...) and lower(...) should be used as function to format a string

## Step 3 - Execute the deployment

- !!! Don't forget to destroy !!!
