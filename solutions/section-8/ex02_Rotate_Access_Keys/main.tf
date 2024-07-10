terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_key_vault_key" "keyThree" {
  name         = "keyThree"
  key_vault_id = "/subscriptions/3a4e6b0d-b00a-4d29-80ef-b39739928325/resourceGroups/rgtfsecretvault/providers/Microsoft.KeyVault/vaults/kv758kuid6dlhzlsos"
  key_type     = "RSA"
  key_size     = 2048
  key_opts     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
}
resource "azurerm_key_vault_key" "keyFour" {
  name         = "keyFour"
  key_vault_id = "/subscriptions/3a4e6b0d-b00a-4d29-80ef-b39739928325/resourceGroups/rgtfsecretvault/providers/Microsoft.KeyVault/vaults/kv758kuid6dlhzlsos"
  key_type     = "RSA"
  key_size     = 2048
  key_opts     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
}

resource "local_file" "credentials" {
  filename          = "credentials"
  file_permission   = "0644"
  sensitive_content = <<-EOF
    [${azurerm_key_vault_key.keyThree.name}]
    modulus = ${azurerm_key_vault_key.keyThree.n}]

    [${azurerm_key_vault_key.keyFour.name}]
    modulus = ${azurerm_key_vault_key.keyFour.n}]
    EOF
}
