variable "app_name" {
  description = "The name which should be used for this Linux Web App"
  type        = string
}

variable "sku_name" {
  description = "Service Plan SKU"
  type        = string
  default     = "S1"
}

variable "rg_name" {
  description = "Resource Group where the App Service Plan exists."
  type        = string
}

variable "location" {
  description = "The Region where the Web App should exist."
  type        = string
  default     = "North Europe"
}

variable "tags" {
  description = "Tags to set"
  type        = map(string)
  default = {
  }
}

