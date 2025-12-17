resource "azurerm_resource_group" "rg" {
  name     = "lifecycle-rg"
  location = "Central India"
}

resource "azurerm_virtual_machine" "vm" {
  name                  = "vm-v1"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = []
  vm_size               = "Standard_B1s"

  lifecycle {
    create_before_destroy = true
  }
}
