
locals {
  project_name = "techlines"
  environment  = "dev-tf"
  location     = "eastus"

  tags = {
    environment = local.environment
    project     = local.project_name
    owner       = "training-team"
  }
}
resource "azurerm_resource_group" "rg" {
  name     = "${local.project_name}-${local.environment}-rg"
  location = local.location
  tags     = local.tags
}

# resource "azurerm_virtual_network" "r-app-sh-vnet" {
#   name                = "app-sh-vnet"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   address_space       = ["10.0.0.0/16"]
# }

# resource "azurerm_subnet" "r-app-sh-subnet" {
#   name                 = "app-sh-subnet"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["10.0.1.0/24"]
# }



