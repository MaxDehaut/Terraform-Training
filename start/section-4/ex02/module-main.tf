
# # Resource Group
# resource "azurerm_resource_group" "training" {
#   name     = 
#   location = 

#   tags = {
#     "environment" = "training"
#     "costalloc"   = 
#   }
# } 

# # Virtual Network
# resource "azurerm_virtual_network" "training" {
#   name                = 
#   resource_group_name = 
#   location            = 
#   address_space       = ["10.0.0.0/16"]
# }

# # Subnet
# resource "azurerm_subnet" "training" {
#   name                 = "internal"
#   virtual_network_name = 
#   resource_group_name  = 
#   address_prefixes     = ["10.0.1.0/24"]
# }