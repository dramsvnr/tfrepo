####### Method 1: CLI##############

terraform plan -var "rgname=techlines-dev-rg" -var "rglocation=centralUS"
terraform apply -var "rgname=techlines-dev-rg" -var "rglocation=centralUS"
terraform destroy -var "rgname=techlines-dev-rg" -var "rglocation=centralUS"

