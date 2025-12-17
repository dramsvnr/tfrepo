**Terraform Resource Lifecycle Management**

----
Terraform **lifecycle management** controls how Terraform creates, updates, and deletes resources.

**lifecycle Options**  
1. create_before_destroy  
2. prevent_destroy  
3. ignore_changes  

**How do you declare them ?**  
<pre>
lifecycle {
  create_before_destroy = true
  prevent_destroy       = true
  ignore_changes        = []
}
</pre>

**Used to:**    
- Avoid downtime  
- Protect critical resources  
- Ignore manual or external changes  

---

**1. create_before_destroy**  

Purpose : Ensures new resource is created first, then old one is destroyed.  
Why Needed? : Avoids service downtime (important for VMs, Load Balancers, App Services).  
Azure Example :  
<pre>
resource "azurerm_virtual_machine" "vm" {
  name = "app-vm-v1"

  lifecycle {
    create_before_destroy = true
  }
}
</pre>

Terraform flow:  

**Create new VM → Switch to New VM → Destroy old VM**  

---  
**2. prevent_destroy**  
**Purpose:** Prevents Terraform from destroying a resource, even if terraform destroy is executed.  
The resource is removed from Terraform configuration

**Common Use Cases**  
Resource Groups  
Databases  
Storage Accounts  
Production Virtual Machines  

**Azure Example**
<pre>
resource "azurerm_resource_group" "rg" {
  name     = "prod-rg"
  location = "Central India"

  lifecycle {
    prevent_destroy = true
  }
}
</pre>

**Result**
Terraform fails with an error:
``Error: Instance cannot be destroyed``

---

**3. ignore_changes**

**Purpose**

Instructs Terraform to *ignore changes to specific resource attributes* during *plan* and *apply*.

**When to Use**

- Tags modified manually  
- Autoscaling updates resource attributes  
- Azure manages or updates fields automatically  

**Azure Example (Ignore Tags)**  
<pre>
resource "azurerm_storage_account" "sa" {
  name                     = "tfstoragedemo"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  lifecycle {
    ignore_changes = [tags]
  }
}
</pre>

Terraform will not detect drift for ignored attributes.

**Ignore All Changes (Use Carefully)**

<pre>
lifecycle {
  ignore_changes = all
}
</pre>

Terraform will stop managing updates for this resource.  
This should be used **only in rare and controlled scenarios**.

---

**Best Practices**

- Use prevent_destroy for production Resource Groups  
- Use create_before_destroy to avoid downtime  
- Use ignore_changes for tags and autoscaling  
- Avoid ignore_changes = all in production  
---
