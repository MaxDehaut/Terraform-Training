# Exercise 7.02 - Terraform & Ansible

This exercise demonstrates the integration of Terraform & Ansible. In this exercise, you will produce a file that can subsequently consumed by Ansible.

!!! This exercise is a bit more complex as the instructions have been deliberatly shorten !!!

## Step 1 - Prepare the exercise

- Have a look at the "inventory.tpl" file which contains Ansible "configuration".
- Create 4 files: main.tf, providers.tf, variables.tf and versions.tf
  - No further instructions will be given regarding the content of these files

## Step 2 - Description of the architecture

- Other than the "typical" one, a variable listing the name of the different VMs to be created should be declared.

- You have to deploy 2 linux virtual machines on a specific virtual network (Azure). To do so, you must use 2 prepackaged modules:

  - Module "network"

    Attribute       | Value                           | Comment
    --------------- | ------------------------------- | -------
    source          | Azure/network/azurerm           |
    subnet_prefixes | 10.0.2.0/24                     |
    subnet_names    | subnet1                         |
    depends_on      | azurerm_resource_group.training |

  - Module "linuxservers"

    Attribute       | Value                           | Comment
    --------------- | ------------------------------- | -------------------
    source          | Azure/compute/azurerm           |
    enable_ssh_key  | false                           |
    vm_os_simple    | "UbuntuServer"                  |
    nb_instances    | 2                               |
    nb_public_ip    | 2                               |
    vm_hostname     | ?                               | be creative
    public_ip_dns   | ?                               | stored in a variable
    vnet_subnet_id  | ?                               | from module "network"
    admin_username  | ?                               | use random_string provider
    admin_password  | ?                               | use random_password provider
    depends_on      | azurerm_resource_group.training |

- A "local_file" resource will be needed to read the "inventory.tpl" file. Please note that the file expects a parameter "vm_dnshost" representing the network interface's private IP (module "network").
  - Exercises 3.03 and 3.04 can help, in case you are lost
  - Use "zipmap()" function to build a map from a list of keys and a corresponding list of values

- 2 outputs should be declared and "expose" (1) the public ips and (2) the dns names

## Step 3 - Execute the main.tf

- Execute the script and visualise the result

!!! Don't forget to destroy the resources created !!!
