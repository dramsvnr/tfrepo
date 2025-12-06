
cd step-a
terraform init
terraform apply -auto-approve
terraform state list    # confirms azurerm_resource_group.app
---

#Step C — copy state file and perform the move

From step-a copy the state to step-b so both share the same terraform.tfstate:

cd ..
cd ./step-b
cp ../step-a/terraform.tfstate ./ 
cp ../step-a/terraform.tfstate ./    # for classroom demo only (local state)
cd ../step-b
terraform init

Now move the resource address in state:
terraform state mv azurerm_resource_group.app module.rg.azurerm_resource_group.app
Verify:
terraform state list
# Expect: module.rg.azurerm_resource_group.app
terraform plan    # should show no changes if state move matches config
Teaching notes
terraform state mv only updates Terraform’s mapping (no API calls to Azure). Use it when refactoring code into modules to prevent Terraform from recreating resources. 
GitHub
Always backup the state before moving: terraform state pull > state-backup.json or copy terraform.tfstate.