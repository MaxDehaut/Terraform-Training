variable AzureSubscriptionId {
    type = "string"
    default = ""
}

variable AzureTenantId {
    type = "string"
    default = ""
}

variable AzureRegion {
    type = "string"
    default = "West Europe"
}

variable "location" {
  description ="The name of the Azure location"
  default ="West Europe"

  validation {
    condition     = can(index(["westeurope","westus"], var.location) >= 0)
    error_message = "The location must be westeurope or westus."
  }
}

variable AzureClientId {
    type = "string"
    default = ""
}

variable AzureClientSecret {
    type = "string"
    default = ""
}