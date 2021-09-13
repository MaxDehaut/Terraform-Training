# Data structure
data "azurerm_resources" "training" {
  type                = "Microsoft.Network/networkSecurityGroups"
  resource_group_name = "Resource Group Name"
}

# Network Security Rule
 resource "azurerm_network_security_rule" "default-rules" {
   for_each                    = { for n in data.azurerm_resources.training.resources : n.name => n }
   name                        = "${each.key}-SSH"
#  ...
   network_security_group_name = each.key
 }
