# Exercise 6.02 - Dynamic block

The purpose of this exercise is to get familiar with the dynamic block. The scenario here is to apply a set of network security rules to an azure resource.

## Step 1 - Prepare the exercise

- Create a main.tf and terraform.tfvars file

## Step 2 - Create the variable holding the values

- In a terraform.tfvars file, define a variable which hold a collection (at least 2) of network security rules. The script below is an example of content.

```terraform
ngs_rules = [
{
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
}
    ...
]
```

## Step 3 - Edit the script

- In the main.tf (check ex 4.06), create a resource with the "azurerm_network_security_group" type.
- Make sure the resource is attached to a resource group and a location
- The resource will hold the collection of network security rules through a dynamic block which should loop on the collection which should have been declared in a variable.

```terraform
dynamic "security_rule" {
    for_each = var.ngs_rules
    content {
        name = security_rule.value["name"]
        priority = security_rule.value["priority"]
        …
    }
}
```

## Step 4 - Execute the main.tf

- Execute the result and check on Azure
