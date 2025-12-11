module "devmodule" {
  source = "./modules/ResourceGroups"
  rglocation = "East US"
  rgname = "app100-RG"
  prefix = "dev"
  
}

module "uatmodule" {
  source = "./modules/ResourceGroups"
  rglocation = "East US"
  rgname = "app100-RG"
  prefix = "uat"
  
}