<#
Lab 3: ignore_changes (Ignore Manual Changes)
Objective 
Check how Terraform ignores specific attribute changes.
Scenario
Ignore manual tag changes in Azure Portal.
------------------------
Step 1: Storage Account Configuration
Step 2: Apply
    > terraform apply
Step 3: Manual Change (Azure Portal)
    Go to Azure Portal
    Update Storage Account tags
    Add new tag: owner=admin
Step 4: Run Plan
    terraform plan
Step 5: Observe Result
    Terraform shows NO changes
    No drift detected for tags
------------------------
take away
✔ Terraform ignores tag drift
✔ Useful when operations teams update resources
✔ Prevents unnecessary updates
#>
