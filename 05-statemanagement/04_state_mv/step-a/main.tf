
resource "azurerm_resource_group" "app" {
  name     = "tfstate-a-rg-${random_id.sfx.hex}"
  location = "eastus"
}

resource "random_id" "sfx" { byte_length = 4 }