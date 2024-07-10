variable "appname" {
  description = "The name of the application"
  default     = "TfTraining"
}

variable "environment" {
  description = "The name of the environment"
  default     = "dev"
}

variable "location" {
  description = "The name of the Azure location"
  default     = "westeurope"
}

variable "vmhosts" {
  type    = list(string)
  default = ["vmwebdemo1", "vmwebdemo2"]
}
