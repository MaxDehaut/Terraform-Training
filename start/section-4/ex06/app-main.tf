# resource "azurerm_linux_virtual_machine" "training" {
#   name                = 
#   resource_group_name = 
#   location            = 
#   size                = "Standard_B1s"
#   admin_username      = 
#   admin_password      = 

#   disable_password_authentication = false

#   network_interface_ids = [

#   ]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "18.04-LTS"
#     version   = "latest"
#   }
# }