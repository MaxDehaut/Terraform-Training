# Exercise 8.04 - Modularizing Code

This exercise shows how to use a json file as a data source.

## Step 1 - Prepare the exercise

- Create 1 file: main.tf
- Create a module called "user"
  - Create a main.tf file in that module

## Step 2 - Edit the script (modules/user/main.tf)

- 3 variables must be declared: domain_name, display_name, login, password
- Declare a "azuread_user" resource with the following structure:

  Attribute           | Value          | Comment
  ------------------- | -------------- | -------------------
  user_principal_name | ?              | Concatenate the login and the domain name as an email
  display_name        | ?              | From the variable
  mail_nickname       | ?              | From the variable (login)
  password            | ?              | From the variable

- Declare an output value with the following content

  ```terraform
  value = <<-EOF
      [<<login>>]
      email = <<user_principal_name>>
    EOF
  ```

## Step 3 - Edit the script (root/main.tf)

- In a "locals" element, set in a variable a map of the file name and its content
  - To read the content of a file, use jsondecode() function
  - You should loop on all the files with a json extension
- The variable declared in the "locals" element should set to an output value

```terraform
locals {
  user_data = {
    for path in fileset(path.module, "users/*.json") : basename(path) => jsondecode(file(path))
  }
}
```

- Declare a module element which should be configured based on the "user" module
- Declare a "local_file" resource which joins all the outputs from the module "user"

```terraform
resource "local_file" "users" {
  filename = "created-users.txt"
  content  = join("\n", [for m in module.user : m.users])
}
```

## Step 4 - Execute the script