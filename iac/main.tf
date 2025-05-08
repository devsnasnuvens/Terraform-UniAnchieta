resource "azurerm_resource_group" "rg" {
  name     = "novo-app-unianchieta"
  location = "eastus2"
}

resource "azurerm_service_plan" "asp" {
  name                = "unianchieta-service-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Windows"
  sku_name            = "S1"
}

resource "azurerm_windows_web_app" "webapp_unianchieta" {
  depends_on = [
    azurerm_service_plan.asp
  ]

  name                = "manzanunianchieta"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    application_stack { 
      dotnet_version = "v8.0"
      current_stack  = "dotnet"
    }
  }
}
