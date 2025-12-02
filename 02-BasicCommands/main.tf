# Create a resource group
resource "azurerm_resource_group" "r-app101-rg" {
  name     = "techlines-dev-rg"
  location = "Central US"
}

resource "azurerm_virtual_network" "r-app-sh-vnet" {
  name                = "techlines-dev-vnet"
  location            = azurerm_resource_group.r-app101-rg.location
  resource_group_name = azurerm_resource_group.r-app101-rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "r-app-sh-subnet" {
  name                 = "techlines-dev-sn"
  resource_group_name  = azurerm_resource_group.r-app101-rg.name
  virtual_network_name = azurerm_virtual_network.r-app-sh-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}




