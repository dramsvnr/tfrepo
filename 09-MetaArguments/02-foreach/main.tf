

resource "azurerm_resource_group" "rg" {
  for_each = var.resource_groups

  name     = "techlines-${each.key}-rg"
  location = each.value
}
