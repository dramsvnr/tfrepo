terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm"{
  features {}
  
  subscription_id = "19ecaf5f-3dd0-49ad-bfea-0ba9f2fd088f"
  client_id       = "978411d2-08df-4521-b770-bafa50e5f187"
  client_secret   = " "
  tenant_id       = "d66f66bc-c6b8-47a7-9128-f1f3fb74a468"
}
