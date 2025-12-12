terraform init
terraform plan --target=module.devrgmodule

terraform apply --target=module.devrgmodule # this will target only dev environment
# if we simply run terraform apply it will run and create all 3 environments
