**Terraform Dynamic Blocks**  

---

**1. What is a Dynamic Block?**  

A dynamic block in Terraform is **used to generate repeated nested blocks dynamically** using loops, instead of writing them manually.  

It is mainly used for **nested configuration blocks**, not resources.  

**Simple Definition**  
Dynamic blocks **help us avoid repeating the same nested block again and again** by generating them using loops like for_each. 

--- 
**2. Why Do We Need Dynamic Blocks?**  

*Without dynamic blocks:*
- Code becomes long and repetitive  
- Hard to manage when values change  
- Not reusable  

*With dynamic blocks:* 
- Cleaner code  
- More flexible  
- Easy to manage multiple similar configurations  
--- 
**3. Where Are Dynamic Blocks Used?**

Dynamic blocks are commonly used when a resource has nested blocks, such as:  
- security_rule inside azurerm_network_security_group  
- ip_configuration inside azurerm_network_interface  
- ingress / egress rules  
- identity, tags, timeouts 

---
**4. Dynamic Block Syntax**
<pre>
dynamic "<BLOCK_NAME>" {
  for_each = <COLLECTION>
  content {
    # nested arguments
  }
}
</pre>

| Component  | Description                                     |
| ---------- | ----------------------------------------------- |
| dynamic    | Keyword to create dynamic nested blocks         |
| BLOCK_NAME | Name of nested block (same as provider expects) |
| for_each   | Loop over list/map                              |
| content    | Actual configuration                            |

---
**Compare Static vs Dynamic**  

❌ Static (Bad for scale)  
<pre>
security_rule {
  name = "AllowSSH"
  ...
}

security_rule {
  name = "AllowHTTP"
  ...
}
</pre>

✅ Dynamic (Best Practice)
<pre>
dynamic "security_rule" {
  for_each = var.security_rules
  content { ... }
}
</pre>


---

**Common Mistakes**

| Mistake                      | Explanation                                            |
| ---------------------------- | ------------------------------------------------------ |
| Using dynamic for resources  | Dynamic blocks only work inside resources              |
| Wrong block name             | Must match provider nested block name                  |
| Confusing count with dynamic | count creates resources, dynamic creates nested blocks |

---