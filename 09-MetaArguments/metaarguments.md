**DAY 9 : Terraform Resource Meta-Arguments**  

---

**What are Meta-Arguments?**  

Meta-arguments are special arguments supported by Terraform resources that **change how resources are created and managed**, not what is created.  

They help control:  
- Number of resources  
- Resource relationships  
- Creation and destruction behavior  

---
**Common Resource Meta-Arguments**  

| Meta-Argument | Purpose                                   |
| ------------- | ----------------------------------------- |
| `count`       | Create multiple identical resources       |
| `for_each`    | Create resources using keys (map/set)     |
| `depends_on`  | Control resource creation order           |
| `lifecycle`   | Control create / update / delete behavior |
| `provider`    | Use alternate provider configuration      |

---

1. `count` Meta-Argument  

What is count?  
count creates **multiple instances of the same resource** using a **numeric index**.

**Syntax**
<pre>
resource "TYPE" "NAME" {
  count = NUMBER
}
</pre>

**Azure Example – Multiple Resource Groups**
<pre>
resource "azurerm_resource_group" "rg" {
  count    = 3
  name     = "count-rg-${count.index}"
  location = "East US"
}
</pre>  

- count.index starts from 0
- Resources are addressed as:
<pre>
azurerm_resource_group.rg[0]
</pre>
- Changing count may destroy and recreate resources

----
**When to Use**  
- Simple identical resources  
- Fixed number of resources  

**When NOT to Use**  
❌ When resources need stable names  
❌ When frequent add/remove is expected  

---

**2.`for_each` Meta-Argument**  

**What is for_each?**  
for_each creates resources using keys **from a map or set**, making it safer and predictable.

SYNTAX
<pre>
resource "TYPE" "NAME" {
  for_each = MAP or SET
}
</pre>

- each.key → resource identifier  
- each.value → resource value  

Resources are addressed as:  
``azurerm_resource_group.rg["dev"] ``
---
**When to Use**
- Environment-based resources
- Production infrastructure
- When resources must not shift
 
**Best Practice**  
Prefer for_each over count in real projects.   
---
**count vs for_each**  
| Feature          | count      | for_each |
| ---------------- | ---------- | -------- |
| Uses index       | ✅ Yes      | ❌ No     |
| Uses keys        | ❌ No       | ✅ Yes    |
| Safe deletion    | ❌ Risky    | ✅ Safe   |
| Production ready | ⚠️ Limited  | ✅ Yes    |

---

3. ``depends_on`` Meta-Argument

**What is depends_on?** 
Forces Terraform to create or destroy resources in a specific order.  

**Why Needed?**  
Terraform usually detects dependencies automatically, but not always.  

Azure Example:
<pre>
resource "azurerm_storage_account" "sa" {
  name                     = "dependssa123"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  depends_on = [
    azurerm_resource_group.rg
  ]
}
</pre>

**Common Use Cases**

- Role assignments    
- Policy assignments    
- Provisioners  
- Module dependencies  
---

- count → numeric, simple, risky  
- for_each → key-based, safe, preferred  
- depends_on → explicit ordering  
- Best practice → use for_each in production  
---
**Summary**  

- Meta-arguments control how Terraform behaves  
- count and for_each manage resource quantity  
- depends_on manages order  
- Choosing the right meta-argument prevents state issues  
---



