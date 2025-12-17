<#
--------------
Lab 2: prevent_destroy (Protect Critical Resources)

Objective
Lets see how Terraform blocks deletion of resources.

Scenario
Protect a Resource Group from accidental deletion.
----------------
Step 1: Resource Group Configuration

Step 2: Apply
> terraform apply
Resource Group is created.

Step 3: Attempt Destroy
terraform destroy

Step 4: Observe Error
-------------
take away
✔ Protects production resources
✔ Prevents accidental destroy
✔ Must be removed manually from code to allow deletion

#>