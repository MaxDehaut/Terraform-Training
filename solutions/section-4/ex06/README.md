# Exercise 4.06 - Cloud-Init

## Step 1 - Create the structure

- Create a 'modules' folder containing 'application' and 'networking' folders
- In each folder, create 3 files: main.tf, outputs.tf and variables.tf
- In the root folder, create 6 files: main.tf, outputs.tf, providers.tf, terraform.tfvars, variables.tf and versions.tf

---

NOTE: Most of the files in the root can be copied from previous exercise (EX 4.05)

---

## Step 2 - ROOT

The main.tf file should contain:

- A declaration of a resource group
- A declaration of the "networking" module
- A declaration of the "application" module

The outputs.tf file should contain:

- An output value representing the public IP of the server that will be accessed through SSH

## Step 3 - Networking module

Reuse (and rename) the net-main.tf and fill it accordingly. Additional details:

- Use the "Dynamic" value to allocate the public and private IP
- The TCP inbound security rule should have a priority of 1001

Make sure you export the network interface identifier as an output value

## Step 4 - Application module

Reuse (and rename) the net-main.tf and fill it accordingly. Additional details:

- Set the private network interface identifier from the networking module

Make sure you export the public IP address (public_ip_address) from the VM as an output value

## Step 5 - ROOT module

Adapt accordingly the module declaration based on the arguments/variables requirements.

## Step 6 - Proceed to deployment

- Proceed to deployment
- Evaluate ssh access using ssh «admin_username»@public_ip
