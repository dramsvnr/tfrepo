resource "azurerm_resource_group" "app" {
  name     = var.name
  location = var.location
}

variable "name" { type = string }
variable "location" { type = string }
