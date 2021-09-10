# Exercise 2.01 - Hello World!

## Step 1 - Create the structure

- Create the "main.tf" file" in the workspace/root folder

## Step 2 - Declarations

- Declare a docker provider

```terraform
terraform {
  required_providers {
    docker = {
      source  = "________"
      version = "________"
    }
  }
}
```

- Declare the docker image

```terraform
resource "docker_image" "nginx" {
  name         = "________"
  keep_locally = false
}
```

- Declare the docker container

```terraform
resource "docker_container" "nginx" {
  image = ________
  name  = "________"
  ports {
    internal = 80
    external = 8000
  }
}
```
