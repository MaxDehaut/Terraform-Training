terraform {
  required_version = ">= 0.15"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }

  }
}

variable "svr_configs" {
  description = "A list of svr config"
  type = object({
    os       = list(string),
    cpu      = list(string),
    ram_size = list(number),
  })
  # default = {"os"=[""], "cpu"=[""], ram_size=[]}

  validation {
    condition     = length(var.svr_configs.ram_size) >= 3
    error_message = "Ram size should be at least 3."
  }
}

resource "random_shuffle" "osShuffle" {
  input = var.svr_configs.os
}

resource "random_shuffle" "cpuShuffle" {
  input = var.svr_configs.cpu
}

resource "random_shuffle" "ramShuffle" {
  input = var.svr_configs.ram_size
}

output "svr_cfg" {
  value = templatefile("${path.module}/typical_svr.json",
    {
      os       = random_shuffle.osShuffle.result
      cpu      = random_shuffle.cpuShuffle.result
      ram_size = random_shuffle.ramShuffle.result
  })
}