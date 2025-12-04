#locals
locals {
  project_name = "techlines"
  environment  = "test"
  location     = "eastus"
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.project_name}-${local.environment}-rg"
  location = local.location
}


#little advanced
# locals {
#   project_name = "techlines"
#   environment  = "dev-tf"
#   location     = "eastus"

#   common_tags = {
#     environment = local.environment
#     project     = local.project_name
#     owner       = "training-team"
#   }
# }
# resource "azurerm_resource_group" "rg" {
#   name     = "${local.project_name}-${local.environment}-rg"
#   location = local.location
#   tags     = local.common_tags
# }

# resource "azurerm_storage_account" "storage" {
#   name                     = "tfstorage"
#   resource_group_name      = azurerm_resource_group.rg.name
#   location                 = azurerm_resource_group.rg.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   tags = locals.common_tags
# }

