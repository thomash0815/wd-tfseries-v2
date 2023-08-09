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

resource "azurerm_resource_group" "web" {
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

module "app" {
  source              = "./modules/webapp"
  app_name            = var.app_name
  resource_group_name = azurerm_resource_group.web.name
  location            = azurerm_resource_group.web.location
  sku_name            = var.sku_name
  tags                = var.tags
}