####### Method 1: CLI##############

terraform plan -var "rgname=techlines-dev-rg-203" -var "rglocation=centralUS"
terraform apply -var "rgname=techlines-dev-rg-203" -var "rglocation=centralUS"
terraform destroy -var "rgname=techlines-dev-rg-203" -var "rglocation=centralUS"

