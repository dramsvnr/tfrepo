
# Create a resource group
resource "azurerm_resource_group" "r-app-rg" {
  name     = "${var.prefix}-${var.rgname}"
  location = "${var.rglocation}"
}

resource "azurerm_virtual_network" "r-app-sh-vnet" {
  name                = "${var.virtual_network_name}"
  location            = azurerm_resource_group.r-app-rg.location
  resource_group_name = azurerm_resource_group.r-app-rg.name
  address_space       = ["${var.vnet_cidr}"]
}

resource "azurerm_subnet" "r-app-subnet" {
  name                 = "${var.prefix}-${var.virtual_subnet_name}"
  resource_group_name  = azurerm_resource_group.r-app-rg.name
  virtual_network_name = azurerm_virtual_network.r-app-sh-vnet.name
  address_prefixes     = ["${var.subnet_cidr}"]
}