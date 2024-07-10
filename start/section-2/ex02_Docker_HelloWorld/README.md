# Exercise 2.02 - Hello World!

## Step 1 - Create the structure

- Create a "main.tf" file

## Step 2 - Declarations

- The file should contain 3 blocks: 1 terraform configuration and 2 resources

- Block 1 - Terraform configuration. This implies to declare the "docker" provider within the Terraform block

```terraform
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}
```

- Block 2 - The docker image as a resource

```terraform
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}
```

- Block 3 - The docker container as a resource

```terraform
resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tfHelloWorld"
  ports {
    internal = 80
    external = 8000
  }
}
```
