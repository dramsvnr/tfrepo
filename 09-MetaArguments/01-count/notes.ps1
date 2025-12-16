#cmds
terraform init
terraform plan
terraform apply

#LAB 1: count Meta-Argument (Create Multiple Resources)
Create multiple Azure Resource Groups using count.

#count.index starts from 0
#Resources are indexed like:
azurerm_resource_group.rg[0]
azurerm_resource_group.rg[1]
#Changing count may recreate resources