**State Management**

---
**What is Terraform State Management?**
- Terraform state management refers to how Terraform keeps track of the real-world cloud resources it creates.
- Terraform stores this information in a file called terraform.tfstate.

**Why do we need State?**
Because Terraform needs to know:
1. What already exists
2. What needs to be created
3. What needs to be updated or destroyed

- Think of state like a database or record of your infrastructure.
- Example : If Terraform creates an Azure resource group, it stores
    - The name
    - The ID
    - The configuration details

So next time you run terraform plan, it compares:
```tf
➡ Your code (desired state)
vs
➡ .tfstate file (current state)
```
Then Terraform decides what changes are needed.

---
**Where State is Stored**
1. Local State
    - Default location: terraform.tfstate
    - Stored in working directory
    - Good for learning/testing
2. Remote State  
Used when multiple people or automation interact with Terraform.  

Common backends:   
- Azure Storage Account(Azure)
- S3 bucket (AWS)
- GCS bucket (Google Cloud)
- Terraform Cloud  

Benefits:
- Collaboration
- Better security & backups
- Locking (prevents parallel conflicting changes)
---
***LAB 1***  
1. Local State
2. Adding Remote backends
---

**State Locking**  
Prevents multiple people from applying changes at the same time,As they could overwrite each other’s changes.
- Enabled automatically with remote backends (Azure blob, Terraform Cloud)  
**How Azure State Locking Works**
1. Terraform runs ```apply``` or ```plan```
2. It requests a lease lock on the .tfstate file stored in Azure storage
3. While lease is held:  
✔️ No one else can modify the state
✔️ Any second Terraform apply will wait or fail
4. When operation completes:  
✔️ Lease is released

So Azure Storage uses Blob leasing feature as the lock mechanism.

---
