resource "random_string" "login" {
  length  = 8
  special = false
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@/'\""
}

# Resource Group
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
  admin_username      = random_string.login.id
  admin_password      = random_password.password.result

}

resource "local_file" "inventory" {
  filename = "inventory.yml"
  content = templatefile("inventory.tpl",
    {
      vm_dnshost = zipmap(var.vmhosts, module.linuxservers.network_interface_private_ip)
  })
}

output "ips" {
  value = module.linuxservers.public_ip_address
}

output "dns" {
  value = module.linuxservers.public_ip_dns_name
}
