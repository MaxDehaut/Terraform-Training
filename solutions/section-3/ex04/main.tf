terraform {
    required_version = ">= 0.15"
    required_providers {
        random= {
            source= "hashicorp/random"
            version = "~> 3.0"
        }
        local = {
            source  = "hashicorp/local"
            version = "~> 2.0"
        }
        archive = {
            source  = "hashicorp/archive"
            version = "~> 2.0"
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

variable "num_files" {
  default = 10
  type    = number
}

locals {
    lcase_cfgs = { for k, v in var.svr_configs : k => [for s in v : lower(s)] }
    templates = tolist(fileset(path.module, "templates/*.json"))
}

resource "random_shuffle" "random_os" {
    count = var.num_files
    input = local.lcase_cfgs["os"]
}

resource "random_shuffle" "random_cpu" {
    count = var.num_files
    input = local.lcase_cfgs["cpu"]
}

resource "random_shuffle" "random_ram_size" {
    count = var.num_files
    input = var.svr_configs["ram_size"]
}

# output "out_cfg" {
#     value = templatefile("${path.module}/templates/tpl_01.json",
#         {
#             os          = random_shuffle.random_os.result
#             cpu         = random_shuffle.random_cpu.result
#             ram_size    = random_shuffle.random_ram_size.result
#         }
#     )
# }

resource "local_file" "out_cfg" {
    count    = var.num_files
    filename = "configs/cfg-${count.index}.json"
    content = templatefile(element(local.templates, count.index),
    {
        os          = random_shuffle.random_os[count.index].result
        cpu         = random_shuffle.random_cpu[count.index].result
        ram_size    = random_shuffle.random_ram_size[count.index].result
    })
}

data "archive_file" "zip_cfg" {
    depends_on  = [local_file.out_cfg]
    type        = "zip"
    source_dir  = "${path.module}/configs"
    output_path = "${path.cwd}/config.zip"
}
