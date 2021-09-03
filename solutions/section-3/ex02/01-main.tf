terraform {
    required_version = ">= 0.15"
}

variable "svr_configs" {
    description = "A list of server config"
    type = object ({
        os   = list(string),
        cpu   = list(string),
        ram_size  = list(number),
    })

    validation {
        condition     = length(var.svr_configs["ram_size"]) >= 7
        error_message = "A minimum of ram sizes is required."
    }
}