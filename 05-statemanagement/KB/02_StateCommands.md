**State Management**
**Part 2**

---
**Viewing and Working with State**
**Commands:**
📌 ```terraform state list```
    Shows all resources Terraform tracks.

📌 ```terraform state show <resource>```
    Shows detailed state info for a resource.

📌 ```terraform state mv```
-  Used to change the resource’s address inside the state file without modifying the real Azure resource.
-  Moves resources between modules.
-  ```terraform state mv``` only updates Terraform’s mapping (no API calls to Azure).
-  Use it when refactoring code into modules to prevent Terraform from recreating resources.
-  Use it for Renaming resources.
-  Always backup the state before moving: ```terraform state pull > state-backup.json``` or copy ```terraform.tfstate```.
    **What actually happens during state mv**
    1. Terraform does NOT call any Azure APIs.
    2. Only the state file changes:
        - Old address is removed.
        - New address is added with exact same attributes.
    3. Because Azure is untouched, no recreation happens if addresses match config.

📌 ```terraform state rm```
    Removes an item from state (careful — Terraform will recreate it next apply).

---

---
***LAB 2***  
Viewing and Working with State

---
Need to add content 
- Terraform import
- Terraform pull & Terraform push
- Multiple environment states
- Using statefile in outputs ex: vnet

==============
rough
==============
1.for state mv 






