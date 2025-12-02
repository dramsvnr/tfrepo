
#step1
#url: https://registry.terraform.io/providers/hashicorp/azurerm/latest
# check required_providers block
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.54.0"
    }
  }
}

# Configure the Microsoft Azure Provider
#sourcelink: https://registry.terraform.io/providers/tfproviders/azurerm/latest/docs/guides/service_principal_client_secret
#client id ,clientsecret,subscriptionid and Tenant id can be taken from Azure Portal
#Once you run terraform init - you can see plugins downloaded under 'Providers' folder inside '.terraform'

provider "azurerm" {
  features {}
  
  subscription_id = "19ecaf5f-3dd0-49ad-bfea-0ba9f2fd088f"
  client_id       = "978411d2-08df-4521-b770-bafa50e5f187"
  client_secret   = "eu.8Q~KT8gFV2j.7vBZJmTqxxagoC5rP1NzadaeM"
  tenant_id       = "d66f66bc-c6b8-47a7-9128-f1f3fb74a468"
}


# Create a resource group
resource "azurerm_resource_group" "r-app101-rg" {
  name     = "app101-rg"
  location = "Central US"
}

resource "azurerm_virtual_network" "r-app-sh-vnet" {
  name                = "app-sh-vnet"
  location            = azurerm_resource_group.r-app101-rg.location
  resource_group_name = azurerm_resource_group.r-app101-rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "r-app-sh-subnet" {
  name                 = "app-sh-subnet"
  resource_group_name  = azurerm_resource_group.r-app101-rg.name
  virtual_network_name = azurerm_virtual_network.r-app-sh-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# step2 
# uncomment module Block and run Terraform Init
# rg module sourced from the Terraform Registry. 
# Terraform will automatically download this module during 'terraform init'.
# You can also use modules stored in GitHub or any other accessible location.
#Once you run terraform init - you can see modules downloaded under 'Modules' folder inside '.terraform'

module "rg" {
  source  = "terraform-az-modules/resource-group/azure"
  version = "1.0.1"   # try a different version
  name    = "example-rg-tf"
  location= "East US"
}


#notes
#terraform init initializes the working directory, 
#downloads only the module sources that are referenced by your current configuration (root module and any modules you call from it),
#installs required provider plugins

#The resource blocks above are inside the root module because it is not inside a module block or a separate module directory.
#resource groups, VNets, subnets in the same folder = root module resources.
#./
  # main.tf
  # rg.tf
  # vnet.tf
  # variables.tf
  # outputs.tf

# Child module example
  # ./modules/network/main.tf
  # If root module uses:
      # module "network" {
      #   source = "./modules/network"
      # }
# Then everything inside that folder becomes a child module, not the root.


