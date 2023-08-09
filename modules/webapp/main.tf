resource "random_integer" "this" {
  min = 1
  max = 50000
}

resource "azurerm_service_plan" "this" {
  name                = join("", [var.app_name, "-sp"])
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.sku_name
  tags                = var.tags
}


resource "azurerm_linux_web_app" "this" {
  name                = join("", [var.app_name, random_integer.this.result])
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.host.id
  https_only          = "true"
  tags                = var.tags

  site_config {

  }
}