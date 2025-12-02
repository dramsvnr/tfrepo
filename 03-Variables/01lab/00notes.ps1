####### Method 1 ##############

#empty variable blk declaration
# No default value
#run terraform init to initialize terraform in 01lab
terraform init
#run terraform plan
# Observer it will prompt for values
# ctrl+c to come out of the prompt
terraform plan
#try terraform apply
# Observer it will also prompt for values
# ctrl+c to come out of the prompt
terraform apply

#conclusion: if you dont pass default value and keep the block empty it will prompt for each value 
#it will be interactive mode

####### Method 1: CLI##############

terraform plan -var "rgname=techlines-dev-rg" -var "rglocation=centralUS"
terraform apply -var "rgname=techlines-dev-rg" -var "rglocation=centralUS"
terraform destroy -var "rgname=techlines-dev-rg" -var "rglocation=centralUS"

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

####### Method 3: Environment variables ##############

#Set an environment variable
#in PowerShell	$env:TF_VAR_rglocation = "centralus"
#in Bash (macOS/Linux)	export TF_VAR_rglocation="centralus"
$env:TF_VAR_rgname="techlines-dev-rg"
$env:TF_VAR_rglocation="centralus"

terraform plan
terraform apply

########## variable definition precedence #############
Highest to lowest
# 1. -var or -var-file
# 2. *.auto.tfvars
# 3. terraform.tfvars
# 4. environment variable export/$env 



