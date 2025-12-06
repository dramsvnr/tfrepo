
locals {
  project_name = "techlines"
  environment  = "dev"
  location     = "centralus"

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

resource "random_id" "suffix" {
  byte_length = 4
}

