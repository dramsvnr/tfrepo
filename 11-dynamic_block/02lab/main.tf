resource "azurerm_network_security_group" "nsg" {
  name                = "dynamic-nsg2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

dynamic "security_rule" {
  for_each = var.nsg_rules

  content {
    name                       = security_rule.key
    priority                   = security_rule.value.priority
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = security_rule.value.port
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
}
