<#
step1: checkk tf files
---------
Step 2: Apply Configuration
terraform init
terraform apply

VM vm-v1 is created.
---------
Step 3: Force Replacement
Change VM name: name = "vm-v2"

terraform plan
-----------
Step 4: Observe the Plan

+ create new VM (vm-v2)
- destroy old VM (vm-v1)

#Create happens first, then destroy.
------------
> Take away
✔ Prevents downtime
✔ Useful for production workloads
✔ Requires unique names or supporting resources


#>