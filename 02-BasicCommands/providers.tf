
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
  }
}
#update these details before deployment
provider "azurerm" {
  features {}

  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
}