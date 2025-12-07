**Terraform State Import (terraform import)**  

Import = Bring existing real cloud resources into Terraform state.   
If something is created manually in Azure, you can "import" it so Terraform starts managing it.    

👉 Terraform learns about an existing resource — it does NOT create anything.  
---

**Terraform State Push (terraform state push)**  

Push = Upload your local state file to a remote backend (rarely used manually).  
Useful only when manually fixing or syncing a corrupt/old state file.  

👉 Sends your local state → remote backend.  
---

**Terraform State Pull (terraform state pull)**  

Pull = Download the current remote state file to your local machine.  
You use it to view, debug, or compare what's stored in remote state.  

👉 Gets remote state → local (read-only unless you manually edit).   
---
**When do we use terraform state pull?**   
1. Debugging state issues: You think state is corrupted or mismatched with Azure resources.  
2. Comparing two state versions  
3. Backing up the current state manually  
4. Checking what Terraform is tracking  

**When do we use terraform state pull?**   
1. State file got corrupted in remote backend. → Download locally → fix JSON → push the corrected file.  
2. Accidental deletion of remote state.→ Restore backup locally → push restored state.  
3. Backend migration issues.   
4. Manually repairing mismatched resource IDs.→ Pull → edit → push.  
___