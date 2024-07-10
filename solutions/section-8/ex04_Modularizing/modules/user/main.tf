variable "display_name" {
  type = string
}

variable "login" {
  type = string
}

variable "password" {
  type = string
}

resource "azuread_user" "training" {
  user_principal_name = "${var.login}@cadai.onmicrosoft.com"
  display_name        = var.display_name
  mail_nickname       = var.login
  password            = var.password
}

output "users" {
  value = <<-EOF
    [${azuread_user.training.mail_nickname}]
    email = ${azuread_user.training.user_principal_name}
  EOF
}
