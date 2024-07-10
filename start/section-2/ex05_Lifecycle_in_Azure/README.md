# Exercise 2.05 - Lifecycle in Azure

## Step 1 - Prepare the environment

- Collect the solution file from exercise 2.03

## Step 2 - Perform the deployment process

- Initialise the terraform workspace
  - When done, check the content of the '.terraform' folder and see what has been created

```terraform
terraform init
```

- Execute the plan and export it to a readable format: JSON
  - When done, check the content of the json file. Rings a bell ?

```terraform
terraform plan -out "plan.out"
terraform show -json "plan.out" > "plan.json"
```

- Execute the script and deploy the resource based on the output from the plan generation
  - When done, check on Azure Portal

```terraform
terraform apply "plan.out"
```

- List the existing states and check that the resource group is present

```terraform
terraform state list
```

## Step 3 - Update the resource (in main.tf)

- Update the resource group by adding a tag

  Attribute   | Value
  ----------- | --------
  "costalloc" | "it-dev"

- Execute the plan again and check what has changed

```terraform
terraform plan
```

- Execute the script and deploy the resource (without the output)
  - When done, check on Azure Portal

```terraform
terraform apply -auto-approve
```

---

NOTE: Keep the current state as it will be used during the next exercise

---
