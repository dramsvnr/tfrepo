<pre>
cd step-a
terraform init
terraform apply -auto-approve
terraform state list    # confirms azurerm_resource_group.app
</pre>
---

#Step2— copy state file and perform the move

From step-a copy the state to step-b so both share the same terraform.tfstate:
<pre>
cd ..
cd ./step-b
cp ../step-a/terraform.tfstate ./ 
cp ../step-a/terraform.tfstate ./    # for classroom demo only (local state)
cd ../step-b
terraform init
</pre>

Now move the resource address in state:
```terraform state mv azurerm_resource_group.app module.rg.azurerm_resource_group.app```
Verify:
<pre>
terraform state list
# Expect: module.rg.azurerm_resource_group.app
terraform plan  # should show no changes if state move matches config
</pre>