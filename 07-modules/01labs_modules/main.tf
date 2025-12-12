
module "devrgmodule" {
  source = "./modules/ResourceGroups"
  rgname = "techlines-rg"
  rglocation = "CentralUS"
  prefix = "dev"
}
output "rgid" {
  value = module.devrgmodule.rgid
}

# module "uatrgmodule" {
#   source = "./modules/ResourceGroups"
#   rgname = "techlines-rg"
#   rglocation = "CentralUS"
#   prefix = "uat"
# }