# Exercise 4.07 - Initialise deployed server

This exercise extends the previous exercise (ex 4.06).

## Step 1 - Create the structure

- Copy the solution files from exercise 4.06

## Step 2 - Provider

- The "cloud_init" provider we will use is the one supported/maintained by HashiCorp (hashicorp/cloudinit).

## Step 3 - Data structure

- A data structure ([cloudinit_config](https://registry.terraform.io/providers/hashicorp/cloudinit/latest/docs)) should declared to reflect the configuration to be deployed on the provisioned server.
- Its attributes should activate the gzip and the base64_encode mode
- The content type should be "text/cloud-config"
- The content should be "packages: ['httpie']"

## Step 4 - Linux Virtual Machine definition

- The virtual machine resource needs to be updated so the server can be configured
- The resource should be extended with an additional parameter ("customer_data")
- The value should come from the data structure, the output value being "rendered"

## Step 5 - Proceed to deployment

- Proceed to deployment
- Evaluate ssh access using ssh «admin_username»@public_ip
- Once access, use the following command to check that 'httpie' works:
  - http httpbin.org/status/418
