
module "rg" {
  source   = "../modules/rg_module"
  name     = "tfstate-b-rg-REPLACEME" # placeholder; we'll move state
  location = "eastus"
}