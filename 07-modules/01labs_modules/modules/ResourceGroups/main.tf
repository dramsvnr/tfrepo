# Create a resource group
resource "azurerm_resource_group" "r-app-rg" {
  name     = "${var.prefix}-${var.rgname}"
  location = var.rglocation
}

