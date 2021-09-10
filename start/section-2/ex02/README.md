# Exercise 2.02 - Hello Azure!

## Step 1 - Login to Azure

- For sake of simplicity, Azure CLI will be used. Use "az login" to perform authentication
- Go to the resource group page

## Step 2 - Declarations

- In the main.tf file, make sure you update the Azure Resource Group declaration

```terraform
resource "azurerm_resource_group" "___________" {
  name     = "___________"
  location = "___________"

  tags = {
    "___________" = "___________"
  }
}
```

## Step 3 - Deployment

- Execute the following deployment steps:
  - terraform init
  - terraform plan
  - terraform apply
- Check the Azure resource group page and make sure the resource has been properly created
- Destroy the resource group via the "destroy" command
