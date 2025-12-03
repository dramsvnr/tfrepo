resource "azurerm_resource_group" "r-app101-rg" {
  name     = var.rgname
  location = var.rglocation
}


# # Create a resource group
# resource "azurerm_resource_group" "dev_blk" {
#   name     = var.rgname
#   location = var.rglocation
# }
