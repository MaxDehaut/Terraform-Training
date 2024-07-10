terraform {
  required_version = ">= 0.12"
}

resource "null_resource" "doSomething" {

  provisioner "local-exec" {
    command = "cowsay Hello World!"
  }
  provisioner "local-exec" {
    when    = destroy
    command = "cowsay -d Goodbye cruel world!"
  }

}
