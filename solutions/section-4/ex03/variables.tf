variable "costalloc" {
  type        = string
  description = "The cost allocation used for all resources in this exercise"
  default     = "training"
}

variable "location" {
  type        = string
  description = "The Azure location where all resources in this exercise should be created"
  default     = "West Europe"
}

variable "suffix" {
  type        = string
  description = "The suffix used to name all resources in this exercise"
  default     = "West Europe"
}