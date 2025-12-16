
resource "azurerm_resource_group" "rg" {
  count    = var.rg_count
  name     = "count-rg-${count.index}"
  location = var.location
}

#Resources are indexed like:
#azurerm_resource_group.rg[0]
#azurerm_resource_group.rg[1]