**State Management**
**Part 2**

---
**Viewing and Working with State**
**Commands:**
1. ```terraform state list```
    Shows all resources Terraform tracks.

2. ```terraform state show <resource>```
    Shows detailed state info for a resource.

3. ```terraform state mv```
-  Used to change the resource’s address inside the state file without modifying the real Azure resource.
-  Moves resources between modules.
-  ```terraform state mv``` only updates Terraform’s mapping (no API calls to Azure).
-  Use it when refactoring code into modules to prevent Terraform from recreating resources.
-  Use it for Renaming resources.
-  If plan shows destroy/create after refactor, don’t apply — fix the state.
-  Always backup the state before moving: ```terraform state pull > state-backup.json``` or copy ```terraform.tfstate```.
-  state mv is the safe way to refactor without deleting your Azure resources.

    **What actually happens during state mv**
    1. Terraform does NOT call any Azure APIs.
    2. Only the state file changes:
        - Old address is removed.
        - New address is added with exact same attributes.
    3. Because Azure is untouched, no recreation happens if addresses match config.

4. ```terraform state rm```
    Removes an item from state (careful — Terraform will recreate it next apply).

---
***LAB 2***  
Viewing and Working with State commands
---





