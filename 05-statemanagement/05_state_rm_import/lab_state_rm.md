**Step1:**  
```cd tfrepo/05-statemanagement/05_state_rm```  

**step2:**
<pre>
terraform init
terraform apply -auto-approve
</pre>
Expected Azure Resources Created:  
✔ Resource Group  
✔ Storage Account  

**step3:Verify Resources in Terraform State**  
```terraform state list```  

expected
<pre>
azurerm_resource_group.rg
azurerm_storage_account.sa
</pre>

**step4: Remove the Storage Account from Terraform State (NOT from Azure!)**  
```terraform state rm azurerm_storage_account.sa```  
Expected output:  
``` Removed azurerm_storage_account.sa ```  
List state again:  
```terraform state list```  
Expected result:  
```azurerm_resource_group.rg```  
Important: The storage account still exists in Azure — only Terraform's tracking is removed.  

**step5: Run Terraform Plan After Removing from State**   
```terraform plan```  
Expected result:   
Terraform thinks the storage account does not exist, so it will try to create a NEW storage account:  
```
+ azurerm_storage_account.sa will be created  
```
Notes :  
- Terraform relies 100% on state to know what already exists.  
- Since the SA is removed from state, Terraform thinks it must create it again.  

**Step 6: Apply Again**   
```terraform apply -auto-approve```  
Terraform tries to create the storage account, but:  
- If the name is globally unique, apply succeeds AND a second storage account is created.  
- If the name already exists (Azure global naming conflict), apply fails with:  
```A storage account named <name> already exists.  
```

Notes :   
- Because we removed it from Terraform state, Terraform does not know it already exists → conflict error.  

---

**Step 7. How to Fix This Using Import**   
If plan shows this conflict, teach them how to re-attach Azure resources using:  
1. Get Storage Account Resource ID  
<pre>
az storage account show \
  --name <your_storage_account_name> \
  --resource-group state-rm-demo-rg \
  --query id -o tsv
  </pre>
2. Import Back  
```terraform import azurerm_storage_account.sa <resource-id>```  
3. Run a clean plan:  
```terraform plan```  

---
**SUMMARY**
✔ terraform state rm  
Removes resource only from Terraform state, not from Azure.  
Terraform loses memory of that resource.  
Next plan will attempt to create it again.  

✔ Typical real-world use cases:  
Stop managing legacy resources.  
Replace Terraform-managed object with manually managed resource.  
Fix corrupted state entries.  

✔ To restore tracking → you must use terraform import.  







