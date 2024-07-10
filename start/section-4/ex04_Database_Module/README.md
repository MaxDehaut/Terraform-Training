# Exercise 4.04 - Database module

## Step 1 - Create the structure

- In the root folder,
  - Collect the files from previous exercise (ex 4.02)
  - Create a folder "database" within the "modules" folder
- In the "database" folder,
  - Create 3 files: main.tf, outputs.tf and variables.tf

## Step 2 - Variables

- The variables are the same as those defined in "root". Location can be removed though.
- An additional variable representing the resource group should be declared. Its type is 'any'

## Step 3 - Random providers

- Two "random" resources will be used to generate the database login and password

```terraform
resource "random_pet" "login" {
  length = 3
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@/'\""
}
```

## Step 4 - Ms SQL Server

- Create a Ms SQL Server (azurerm_mssql_server) resource with the following configuration

  Attribute                    | Value         | Comment
  ---------------------------- | ------------- | -------
  name                         | "sql-"+suffix | from root module
  location                     | ?             | from root module (resource group)
  resource_group_name          | ?             | from root module (resource group)
  version                      | "12.0"        |
  administrator_login          | ?             | from random_pet (use 'id')
  administrator_login_password | ?             | from random_password (use 'result')

## Step 5 - Output file

- The output value should be a structure containing the login and password from the SQL Server.

```terraform
output "db_config" {
  value = {
    usr_admin = 
    pwd_admin = 
  }
}
```

## Step 6 - Edit the root files

- The "root" should be updated accordingly
  - The source attribute should reference the "database" folder only
  - Any other attributes/variables used in the "database" module should be set

## Step 7 - Execute the deployment

- !!! Don't forget to destroy !!!
