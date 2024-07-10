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
  name                = "pip-${var.suffix}"
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
  name                = "nic-${var.suffix}"
  location            = var.rg.location
  resource_group_name = var.rg.name

  ip_configuration {
    name                          = "training-nic-config"
    subnet_id                     = azurerm_subnet.training.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.training.id
  }
}

resource "azurerm_network_interface_security_group_association" "training" {
  network_interface_id      = azurerm_network_interface.training.id
  network_security_group_id = azurerm_network_security_group.training.id
}