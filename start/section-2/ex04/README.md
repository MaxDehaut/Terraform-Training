# Exercise 2.04 - Lifecycle Azure

## Step 1 - Prepare the environment

- Collect the solution file from exercise 2.02

## Step 2 - Initialise the workspace

```terraform
terraform init
```

## Step 3 - Generate the plan

```terraform
terraform plan -out plan.out
terraform show -json plan.out > plan.json
terraform graph | dot -Tsvg > graph.svg
```

## Step 4 - Create/Deploy a resource

```terraform
terraform apply "plan.out”
```

## Step 5 - Update a resource

- Update the resource group by adding a tag

```terraform
terraform plan
terraform apply -auto-approve
```

---

NOTE: Keep the current state as it will be used during the next exercise

---
