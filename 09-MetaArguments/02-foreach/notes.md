<pre>
terraform init
terraform plan
terraform apply
</pre>

Resources are tracked by keys, not index  
Safe for add/remove operations  
Access resource like:  
``azurerm_resource_group.rg["dev"]``
