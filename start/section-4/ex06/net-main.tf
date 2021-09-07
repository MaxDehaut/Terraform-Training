# resource "azurerm_virtual_network" "training" {
#   name                = 
#   address_space       = 
#   location            = 
#   resource_group_name = 
# }

# resource "azurerm_subnet" "training" {
#   name                 = 
#   resource_group_name  = 
#   virtual_network_name = 
#   address_prefixes     = 
# }

# resource "azurerm_public_ip" "training" {
#   name                = 
#   location            = 
#   resource_group_name = 
#   allocation_method   = "Dynamic"
# }

# resource "azurerm_network_security_group" "training" {
#   name                = 
#   location            = 
#   resource_group_name = 

#   security_rule {
#     name                       = 
#     priority                   = 
#     direction                  = 
#     access                     = "Allow"
#     protocol                   = 
#     source_port_range          = "*"
#     destination_port_range     = "22"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
# }

# resource "azurerm_network_interface" "training" {
#   name                = 
#   location            = 
#   resource_group_name = 

#   ip_configuration {
#     name                          = 
#     subnet_id                     = 
#     private_ip_address_allocation = 
#     public_ip_address_id          = 
#   }
# }

# resource "azurerm_network_interface_security_group_association" "training" {
#   network_interface_id      = 
#   network_security_group_id = 
# }