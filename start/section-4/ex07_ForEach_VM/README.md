# Exercise 4.07 - For each virtual machine

The objective of this exercise is to help you assessing your understanding of loops.

## Step 1 - Create the structure

- Copy the solution structure from exercise 4.06

## Step 2 - Root module

- Add the following variable containing the names of the 2 virtual machines:

```terraform
variable "vm_names" {
  type        = list(string)
  description = "List of virtual machine names"
  default     = ["vmKepler", "vmNewton"]
}
```

- Alternatively, you can use terraform.tfvars to set the values

## Step 3 - Networking module

- 3 resources are affected by the loops (for_each):

  - Public IP (azurerm_public_ip) with a loop on the name of the virtual machines

  - Network Interface (azurerm_network_interface) with a loop on the name of the virtual machines. Both names (interface and ip config) and the public address id are affected.

  - Network Interface/Security Group (azurerm_network_interface_security_group_association) with a loop on the name of the virtual machines. The network interface id is affected.

- Make sure you export the network interface resource as an output value

## Step 4 - Application module

- Use the loop (for_each) to create the virtual machines (azurerm_linux_virtual_machine)

  - Set the name accordingly
  - The network interface ids should be set with the network interface identifier (from the "networking" module)

```terraform
  network_interface_ids = [var.nics[each.key].id]
```

- Make sure you export the collection of virtual machines

## Step 5 - Back to ROOT module

- Adapt accordingly (if not done yet) the module declarations based on the arguments/variables requirements.
- The outputs.tf file should contain:
  - An output value representing the public IP of the server that will be accessed through SSH.

## Step 6 - Proceed to deployment

- Proceed to deployment
- Check the deployment on the Azure portal

- !!! Don't forget to destroy !!!
