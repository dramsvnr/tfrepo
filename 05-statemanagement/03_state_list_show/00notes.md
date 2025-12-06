Steps

Initialize & apply:
```
terraform init
terraform apply -auto-approve
```
List tracked resources:
```terraform state list```
# Expect: azurerm_resource_group.rg  (plus random_id)
Show detailed state for the resource:
```terraform state show azurerm_resource_group.rg```
```terraform state show random_id.suffix```

Inspect attributes such as id, name, location, tags.