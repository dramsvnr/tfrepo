**WORKSPACE**  

---
- A Terraform Workspace is like having multiple state files for the same Terraform configuration. 
- Think of it as:Same code, different environments (dev, test, prod) — each with its own state.
- Your .tf files stay the same, but each workspace stores its own Terraform state, so resources don’t clash.
---
1. Default Workspace Exists  
    - Every Terraform project starts with a workspace named default.
2. Each Workspace Has Its Own State
    - Workspaces = isolated state files.
    - Resources created in each workspace are independent.
3. Same Code, Different Values
    - You can use variables with workspace name: ```environment = terraform.workspace```
4. Workspaces Are NOT for Everything
    - Workspaces are good for small-medium scale environments.
    - For large orgs → Use separate folders + pipelines, not workspaces.
---

**Terraform Workspace Commands**   

1. List all workspaces   
```terraform workspace list```   
Shows existing workspaces. * marks the active one.   

2. Create a new workspace   
```terraform workspace new dev```    
Creates workspace named dev and switches into it.    

3. Select / Switch workspace   
```terraform workspace select dev```   
Switch to an already-existing workspace.  

4. Show current workspace   
```terraform workspace show```  

5. Delete a workspace    
terraform workspace delete dev    
⚠️ Workspace must be empty (destroy infra before deleting).    
---

