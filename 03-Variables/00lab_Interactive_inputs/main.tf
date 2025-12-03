# resource "azurerm_resource_group" "r-app101-rg" {
#   name     = "techlines-dev-rg"
#   location = "Central US"
# }


# Create a resource group
resource "azurerm_resource_group" "dev_blk" {
  name     = var.rgname
  location = var.rglocation
}
