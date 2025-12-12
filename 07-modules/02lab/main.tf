module "rg" {
  source  = "terraform-az-modules/resource-group/azure"
  version = "1.0.1"  
  custom_name    = "registry"
  location= "East US"
}