
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

resource "azurerm_storage_account" "tfstorage" {
  name                     = "${local.project_name}${local.environment}tfsa"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = local.tags
}

resource "azurerm_storage_container" "tfstate_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstorage.name
  container_access_type = "private"
}

