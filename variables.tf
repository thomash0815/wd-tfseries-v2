variable "resource_group_name" {
  description = "Resource Group where Resources are deployed"
}
variable "location" {
  description = "Location where Product Resources are deployed"
  default     = "north europe"
}

variable "appserviceplan_name" {
  description = "Name of the App Service Plan"
  type        = string
}
variable "sku_name" {
  description = "SKU of the App Service Plan"
  type        = string
}
variable "os_type" {
  description = "OS type of the App Service Plan"
  type        = string
  default     = "Linux"
}

variable "webapp_name" {
  description = "Name of the web app"
  type        = string
}

variable "webapp_names_list" {
  description = "List of names for multiple web apps"
  type        = set(string)
}

variable "identity_type" {
  description = "Identity type for the Web App"
  type        = string
  default     = "SystemAssigned"
}

variable "tags" {
  description = "Tags to set for all resources"
  type        = map(string)

  default = {
    Costcenter  = "1234",
    Environment = "dev"
  }
}