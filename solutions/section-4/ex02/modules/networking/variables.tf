variable "costalloc" {
  type        = string
  description = "Name of cost allocation group"
  default     = "it-hq"
}

variable "location" {
  type    = string
  default = ""
}

variable "suffix" {
  type    = string
  default = ""
}
