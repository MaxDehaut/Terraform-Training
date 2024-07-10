variable "costalloc" {
  type        = string
  description = "The cost allocation used for all resources in this exercise"
  default     = "it-hq"
}

variable "location" {
  type        = string
  description = "The Azure location where all resources in this exercise should be created"
  default     = "West Europe"
}

variable "suffix" {
  type        = string
  description = "The suffix used to name all resources in this exercise"
  default     = "training"
}

variable "vm_names" {
  type        = list(string)
  description = "List of virtual machine names"
}