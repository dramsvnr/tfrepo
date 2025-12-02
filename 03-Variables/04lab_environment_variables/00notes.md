
####### Method 3: Environment variables ##############

#Set an environment variable
# in PowerShell	we declare like this > $env:TF_VAR_rglocation = "centralus"
$env:TF_VAR_rgname="techlines-dev-rg"
$env:TF_VAR_rglocation="centralus"


# in Bash (macOS/Linux)	we declare like this > export TF_VAR_rglocation="centralus"

terraform plan
terraform apply





