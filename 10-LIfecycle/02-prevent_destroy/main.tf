resource "azurerm_resource_group" "rg" {
  name     = "protected-rg"
  location = "Central India"

  lifecycle {
    prevent_destroy = true
  }
}
