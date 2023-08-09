variable "resource_group_name" {
  type = string
  description = "Name of the resouce group to deploy to"
}

variable "location" {
  type = string
  description = "Deployment location"
}

variable "app_name" {
  type = string
  description = "Name of the web app"
}

variable "sku_name" {
  description = "Service Plan SKU"
  type        = string
  default     = "S1"
}

variable "tags" {
  description = "Tags to set"
  type        = map(string)
  default = {
  }
}