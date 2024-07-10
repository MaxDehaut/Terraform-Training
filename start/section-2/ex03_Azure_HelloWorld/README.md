# Exercise 2.03 - Hello Azure!

## Step 1 - Login to Azure

- From Visual Studio Code - terminal, perform an Azure authentication (using the subscription required).

## Step 2 - Declarations

- In the main.tf file provided:

- Make sure you update the provider block accordingly, ie subscription. This block is used to provide additional configuration values to the provider (declared within the Terraform block)

- Declare an Azure resource group resource as such:

```terraform
resource "azurerm_resource_group" "rgTfTraining" {

  ...

  tags = {
    ...
  }
}
```

- The resource block should contain the following values

  Attribute           | Value        | Comment
  ------------------- | ------------ | -------
  name                | ?            | "rg-«your_name»" could be an option
  location            | "westeurope" |

- The tags nested block should contain the following value. Please follow the syntax.

  Attribute     | Value
  ------------- | ----------
  "environment" | "training"

## Step 3 - Deployment

- Execute the following deployment steps:
  - terraform init
  - terraform plan
    - you will be asked to confirm by 'yes'
  - terraform apply
    - you will be asked to confirm by 'yes'
- Check that the resource group has been properly created through Azure Portal
- Destroy the resource group via the "terraform destroy" command
- Check that the resource group has been properly destroyed through Azure Portal
