variable "rg" {
  type = any
}
variable "suffix" {
  type    = string
  default = ""
}

variable "vm_names" {
  type = list(string)
}
