# Exercise 2.06 - Configuration drift in Azure

## Step 1 - Create the structure

- Go back to the folder "ex05..." or copy the content (all the files) exercise 2.05 to the current folder

## Step 2 - Force a configuration drift

- Check on Azure Portal and update the value of one of the tag
- Collect the identifier of the resource group (you can find either on the portal or in the state file)
- Execute the plan again and check the drift has been detected

```terraform
terraform plan
```

- Visualise the current state. It should still contain the previous "configuration"

```terraform
terraform show
```

- Execute the script and refresh the resource only. Terraform should confirm the resource has been updated outside of Terraform workspace. The state should also be updated to reflect the deployed resource.

```terraform
terraform apply -refresh-only
```

- Visualise the current state. It should now contain the current/deployed "configuration"

```terraform
terraform state list
terraform state show «name_of_the_state»
```

## Step 3 - Destroy a resource

```terraform
terraform destroy
```
