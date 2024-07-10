variable "suffix" {
  type    = string
  default = ""
}

variable "rg" {
  type = any
}

variable "nics" {
  type = any
}

variable "vm_names" {
  type = list(string)
}