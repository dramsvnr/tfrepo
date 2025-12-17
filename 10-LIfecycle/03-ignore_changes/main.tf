resource "azurerm_storage_account" "sa" {
  name                     = "lifecyclestor${random_string.rand.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    env = "dev"
  }

  lifecycle {
    ignore_changes = [tags]
  }

#   lifecycle {
#   ignore_changes = all
#    }
}
