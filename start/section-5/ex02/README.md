# Exercise 5.02 - Workspace

## Step 1 - Prepare the workspace

- Copy the main.tf from exercise 5.01 but remove all the "root" elements except "terraform"
- Execute the **terraform init**

## Step 2 - Create the workspace

- List the existing workspace using **terraform workspace list**
- Create 2 new environments: 'dev' and 'prod' using **terraform workspace new [dev/prod]**
- Go on Azure Portal and check the content of the Storage Container. You should see 2 additional tfstate files.
- Once the environments are created, select the 'dev' is selected:
  - **terraform workspace select dev**

## Step 3 - Edit the main.tf

- Copy again the main.tf from exercise 5.01 but, this time, don't remove anything
- Update the resource group name by adding ${terraform.workspace}
- Add a new tag "costalloc" where the:
  - value should be 'it-dev' if the 'dev' workspace is active
  - value should be 'it-prod' if the 'prod' workspace is active

## Step 4 - Prepare the deployment

- Generate the plan into a file (plan-dev).
  - !!! Terraform should ask you to provide the value for some variables

## Step 5 - Deploy

- Execute the terraform script using the "plan-dev"
- Go on Azure Portal and check the different artefacts have been properly created. Also check the content of the remote state file.

## Step 6 - Using variables files

- Create a .tfvars file for each environment
  - Make sure the file name match the name of the environment
- Adapt the main.tf so the tag "costalloc" comes from the file
- Execute the terraform script as such:

```terraform
terraform apply -var-file=./dev.tfvars -auto-approve
```

## Step 7 - Destroy

- Destroy the resources in the same way you create them in Step 6
- Then destroy all the other resources

---

NOTE: Always check that the resources are properly destroyed in Azure Portal. At least during this training ;-)

---
