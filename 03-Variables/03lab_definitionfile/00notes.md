####### Method 2: variable definition files ##############

#These variable definition files are auto loaded
## terraform.tfvars
## terraform.tfvars.json
## *.auto.tfvars
## *.auto.tfvars.json
# all other definitionfiles should be passed along like below
terraform plan -var-file 'dev_env.tfvars'
terraform apply -var-file 'dev_env.tfvars'
terraform destroy -var-file 'dev_env.tfvars'
