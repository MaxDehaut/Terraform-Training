# Exercise 3.04 - Generating multiple configs

## Step 1 - Prepare the environment

- Collect the solution files (incl. 'templates' folder) from exercise 3.03
- Comment (using # in front of each line) the 'output' element

## Step 2 - Add new templates

- Create 2 more templates

## Step 2 - Locals

- Create a 'locals' element with 2 attributes: 
  - lcase_cfgs: 
  - templates

## Step 3 - Generate the plan ... if you can

Lowercase each config before shuffling and store in a local value
Provider: hashicorp/local
Version: ~> 2.0
Create a variable to hold the number of configs to be created (10)
Save configs as files
Zip all configs together
