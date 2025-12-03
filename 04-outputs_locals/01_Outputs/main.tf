resource "azurerm_resource_group" "rg" {
  name     = "rg-techlines-dev"
  location = "eastus"
}

resource "azurerm_public_ip" "vm_pip" {
  name                = "vm-pip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

#static output
output "static_output" {
  value       = "I am like echo in bash - write-host in powershell - printf in c"
  description = "This is static output"
}

#dynamic output
output "rg_id" {
  value       = azurerm_resource_group.rg.id
  description = "Resource Group id"
}

#it gives all outputs
# type . after azurerm_resource_group.rg , it will show all outputs can be used
output "rg_all" {
  value       = azurerm_resource_group.rg
  description = "Resource Group id"
}

output "vm_public_ip" {
  value       = azurerm_public_ip.vm_pip.ip_address
  description = "Public IP of the VM"
}
