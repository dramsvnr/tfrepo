pre requisites for preparing lab
terraform init
terraform apply auto-approve
terraform state rm azurerm_virtual_network.r-app-sh-vnet  
terraform state rm azurerm_subnet.r-app-sh-subnet  
---

terraform import azurerm_virtual_network.r-app-sh-vnet <resource-id>  

terraform import azurerm_subnet.r-app-sh-subnet <resource-id>  
