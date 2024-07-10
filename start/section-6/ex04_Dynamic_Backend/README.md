# Exercise 6.03 - Dynamic backend

The purpose of this exercise is to create a remote backend through a pipeline, based on the repository tag. This exercise is based on exercise 6.03.

## Step 1 - Prepare the exercise (VS Code)

- Add the "select-create-workspace.ps1" file to your project
  - Read its content, can you explain what it does ?
- Push the file to the repository

## Step 2 - Azure DevOps

- Go to Azure DevOps (dev.azure.com)
- Go to pipeline and edi the existing pipeline
- Following the logic learnt in the previous exercise (in that order)
  - Initialise terraform (should be already there)
  - Execute the "select-create-workspace.ps1" script
  - Generate the terraform plan in a file (see section 2)
  - Apply the terraform plan based on a file

- In case a working directory is required, please use the following syntax: $(System.DefaultWorkingDirectory)/

## Step 3 - Execute the pipeline

- Save and run the pipeline and check the output/result
- Check also the content of the storage account

## Step 4 - Destroy all the resources

- You can detroy all the resources created on Azure and Azure DevOps
