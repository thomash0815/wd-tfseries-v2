terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.60.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}
provider "azurerm" {

  features {}
}


resource "random_integer" "this" {
  min = 1
  max = 50000
}

resource "azurerm_resource_group" "web" {
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

module "webapp" {
  source = "git::https://github.com/thomash0815/tf-modules.git//webapp?ref=5387396" #v.1.0.0" #feature/demochange" #"./modules/webapp"

  for_each            = var.webapp_names_list
  webapp_name         = each.value
  resource_group_name = azurerm_resource_group.web.name
  location            = azurerm_resource_group.web.location
  appserviceplan_name = "sp-${each.value}"
  sku_name            = var.sku_name
  os_type             = var.os_type
  identity_type       = var.identity_type
  tags                = var.tags
}

output "webapp_id" {
  value = values(module.webapp)[*].webapp_id
}