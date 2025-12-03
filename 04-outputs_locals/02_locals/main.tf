#locals
locals {
  project_name = "techlines"
  environment  = "dev"
  location     = "eastus"
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.project_name}-${local.environment}-rg"
  location = local.location
}

#little advanced
# locals {
#   project_name = "techlines"
#   environment  = "prod"
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

