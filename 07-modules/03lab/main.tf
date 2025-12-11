module "rg" {
  source  = "terraform-az-modules/resource-group/azure"
  version = "1.0.1"  
  name    = "gh-registry-rg"
  location= "East US"
}