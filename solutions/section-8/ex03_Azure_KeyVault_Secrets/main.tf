data "azurerm_key_vault_secret" "training" {
  name         = "tfUser"
  key_vault_id = "/subscriptions/3a4e6b0d-b00a-4d29-80ef-b39739928325/resourceGroups/rgKeyVault/providers/Microsoft.KeyVault/vaults/kvTfTraining"
}

resource "azurerm_resource_group" "training" {
  name     = format("rg%s%s", var.appname, var.environment)
  location = var.location
}

module "network" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.training.name
  subnet_prefixes     = ["10.0.2.0/24"]
  subnet_names        = ["subnet1"]
  depends_on          = [azurerm_resource_group.training]
}

module "linuxservers" {
  source              = "Azure/compute/azurerm"
  resource_group_name = azurerm_resource_group.training.name
  enable_ssh_key      = false
  vm_os_simple        = "UbuntuServer"
  nb_instances        = 2
  nb_public_ip        = 2
  vm_hostname         = "vmwebdemo"
  public_ip_dns       = var.vmhosts
  vnet_subnet_id      = module.network.vnet_subnets[0]
  depends_on          = [azurerm_resource_group.training]
  admin_username      = "tfUser"
  admin_password      = data.azurerm_key_vault_secret.training.value
}
