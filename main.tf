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

resource "azurerm_service_plan" "host" {
  name                = join("", [var.app_name, "-sp"])
  resource_group_name = azurerm_resource_group.web.name
  location            = azurerm_resource_group.web.location
  os_type             = "Linux"
  sku_name            = var.sku_name
  tags                = var.tags
}

resource "azurerm_linux_web_app" "web_app" {
  name                = join("", [var.app_name, random_integer.this.result])
  resource_group_name = azurerm_resource_group.web.name
  location            = azurerm_resource_group.web.location
  service_plan_id     = azurerm_service_plan.host.id
  https_only          = "true"
  tags                = var.tags

  site_config {

  }
}