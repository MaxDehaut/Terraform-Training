# Exercise 8.03 - Reuse Azure Keyvault Secrets

The purpose of this exercise is to demonstrate to rotate the access keys.

## Step 1 - Prepare the exercise

- Collect the file from the previous exercise (ex 8.01)

## Step 2 - Edit the script

- Declare 2 keyvault secret keys ("azurerm_key_vault_key") wit the following configuration

  Attribute    | Value                                                          | Comment
  ------------ | -------------------------------------------------------------- | -------------------
  name         | ?                                                              | be creative
  key_vault_id | ?                                                              | key vault identifier (see 8.01)
  key_type     | "RSA"                                                          |
  key_size     | 2048                                                           |
  key_opts     | "decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey" |

- In a local file, store the name and modulus of each key

```terraform
resource "local_file" "credentials" {
  filename          = "credentials"
  file_permission   = "0644"
  sensitive_content = <<-EOF
    [${azurerm_key_vault_key.keyOne.name}]
    modulus = ${azurerm_key_vault_key.keyOne.n}]

    [${azurerm_key_vault_key.keyTwo.name}]
    modulus = ${azurerm_key_vault_key.keyTwo.n}]
    EOF
}
```

## Step 3 - Execute the script

- Execute the script
- Save the file generated somewhere "safe"
- List all the states
- Taint one of the resource
- Execute the script again
- Check the modulus of the tainted resource
