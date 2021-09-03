terraform {
    required_version = ">= 0.15"
    required_providers {
        random= {
            source= "hashicorp/random"
            version = "~> 3.0"
      }
  }
}

variable "svr_configs" {
    description = "A list of server config"
    type = object ({
        os   = list(string),
        cpu   = list(string),
        ram_size  = list(number),
    })

    validation {
        condition     = length(var.svr_configs["ram_size"]) >= 5
        error_message = "A minimum of ram sizes is required."
    }
}

resource "random_shuffle" "random_os"{
    input = var.svr_configs["os"]
}

resource "random_shuffle" "random_cpu"{
    input = var.svr_configs.cpu
}

resource "random_shuffle" "random_ram_size"{
    input = var.svr_configs["ram_size"]
}
