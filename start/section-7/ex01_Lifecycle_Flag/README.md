# Exercise 7.01 - Lifecycle flags

## Step 1 - Prepare the exercise

- Copy the main.tf from exercise 3.06

## Step 2 - Edit the script

- Adjust the app service resource so:
  - the count is not used anymore
  - the lifefycle block is added and set to true the "prevent_destroy" for the App Service Plan

```terraform
lifecycle {
    prevent_destroy = true
  }
```

  - the lifefycle block is added and set to true the "creation_before_destroy" for the App Service

```terraform
lifecycle {
    create_before_destroy = true
  }
```

## Step 3 - Execute the main.tf

- Execute the script and visualise the result

## Step 4 - Edit the script

- Update the app service resource's name (by adding "max")

## Step 5 - Execute the main.tf

- Execute the script and visualise the result

!!! Don't forget to destroy the resources created !!!
