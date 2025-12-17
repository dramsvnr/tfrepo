<#
Lab 4: ignore_changes = all (Danger Demo)
do not use in production
------------------------
Step 1: Configuration
Step 2: Change Any Attribute
    Modify VM size, tags, or name.
    >terraform plan
step 3: Observation
Terraform shows: No changes
-------------------------
take away
- Terraform stops managing the resource
- Dangerous in production
- Only for special cases
#>