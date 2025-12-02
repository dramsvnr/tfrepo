


# Create a resource group
resource "azurerm_resource_group" "dev_blk" {
  name     = var.rgname
  location = var.rglocation
}
