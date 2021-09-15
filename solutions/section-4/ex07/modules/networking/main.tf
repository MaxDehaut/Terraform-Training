resource "azurerm_virtual_network" "training" {
  name                = "vnt-${var.suffix}"
  address_space       = ["10.0.0.0/16"]
  location            = var.rg.location
  resource_group_name = var.rg.name
}

resource "azurerm_subnet" "training" {
  name                 = "sub-${var.suffix}"
  resource_group_name  = var.rg.name
  virtual_network_name = azurerm_virtual_network.training.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "training" {
  for_each            = toset(var.vm_names)
  name                = "pip-${each.value}"
  location            = var.rg.location
  resource_group_name = var.rg.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_security_group" "training" {
  name                = "scg-${var.suffix}"
  location            = var.rg.location
  resource_group_name = var.rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "training" {
  for_each            = toset(var.vm_names)
  name                = "nic-${each.value}"
  location            = var.rg.location
  resource_group_name = var.rg.name

  ip_configuration {
    name                          = "nic-ipc-${each.value}"
    subnet_id                     = azurerm_subnet.training.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.training[each.key].id
  }
}

resource "azurerm_network_interface_security_group_association" "training" {
  for_each                  = toset(var.vm_names)
  network_interface_id      = azurerm_network_interface.training[each.key].id
  network_security_group_id = azurerm_network_security_group.training.id
}