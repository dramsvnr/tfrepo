terraform {
  backend "azurerm" {
    resource_group_name  = "techlines-dev-rg"
    storage_account_name = "techlinesdevtfsa"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}