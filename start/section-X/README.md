
resource "random_password" "password" {
  length = 16
  special = true
  override_special = "_%@"
}
random_password.password.result

data "archive_file" "backup" {
  type        = "zip"
  source_file = "../mytextfile.txt"
  output_path = "${path.module}/archives/backup.zip"
}

locals {
  resource_name = "${var.application_name}-${var.environment_name}-${var.country_code}"
}

resource "azurerm_resource_group" "rg" {
  name     = "RG-${local.resource_name}"
  location = data.external.getlocation.result.location
}


data "external" "getlocation" {
  program = ["Powershell.exe", "./GetLocation.ps1"]

  query = {
    environment = "${var.environment_name}"
  }
}

output "locationname" {
  value = data.external.getlocation.result.location
}

#resource "azurerm_resource_group" "rg-app" {
#  name     = upper(format("RG-%s-%s",var.app_name,var.environment))
#  location = "westeurope"
#}

#FOR CONDITION
resource "azurerm_resource_group" "rg-app" {
  name     = var.environment == "Production" ? upper(format("RG-%s", var.app_name)) : upper(format("RG-%s-%s", var.app_name, var.environment))
  location = "westeurope"
}



resource "azurerm_template_deployment" "extension" {
  name                = "extension"
  resource_group_name = azurerm_resource_group.rg-app.name
  template_body       = file("ARM_siteExtension.json")

  parameters = {
    appserviceName   = azurerm_app_service.app.name
    extensionName    = "AspNetCoreRuntime.2.2.x64"
    extensionVersion = "2.2.0-preview3-35497"
  }

  deployment_mode = "Incremental"
}


resource "null_resource" "webapp_static_website" {
  triggers = {
    account = azurerm_storage_account.sa.name
  }

  provisioner "local-exec" {
    command = "az storage blob service-properties update --account-name ${azurerm_storage_account.sa.name} --static-website true --index-document index.html --404-document 404.html"
  }
}