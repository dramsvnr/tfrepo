**1. What is a Module?**  

- A module = a folder containing Terraform files (.tf files).  
- It helps you group related resources together so your code becomes clean and reusable.  
---

**2. Why do we use Modules? (Very Important)**  

- Reusability → Write once, use multiple times  
- Organization → Large infra broken into small logical pieces  
- Consistency → Same naming, tagging, structure everywhere  
- Team collaboration → Each team can work on separate modules  
- Reduced code duplication  
---

**3. Types of Modules**

**a) Root Module**  
- The main folder where you run Terraform commands.  
- Contains your main.tf, variables.tf, outputs.tf.  

**b) Child Module**  
- A sub-folder you call from the root module.  
- Example: modules/vnet, modules/compute.  

**c) Public Modules**
- Modules created by community → found in Terraform Registry.  
---

**4. Module Structure (Very Simple)**  
A typical module has:
<pre>
my-module/
  main.tf        → resource definitions
  variables.tf   → input variables
  outputs.tf     → output variables
</pre>
---
**5. How to Call a Module**  
Inside your root module:  
<pre>
module "network" {
  source = "./modules/vnet"
  vnet_name = "app-vnet"
  location  = "eastus"
}
</pre>
---
**6. Module Inputs**  
- Inputs are values you pass into a module.  
- Defined in variables.tf.  
<pre>
variable "location" {
  type = string
}
</pre>
---
**7. Module Outputs**  
- Outputs are values returned by the module.  
- Used by other modules or for reference.  
<pre>
output "vnet_id" {
  value = azurerm_virtual_network.main.id
}
</pre>
---
**8. Module Source Options**  

You can get modules from:  

*Local Path*  
<pre>
source = "./modules/vnet"
</pre>

*GitHub*  
<pre>
source = "github.com/company/repo//modules/vm"
</pre>

*Terraform Registry*  
<pre>
source = "Azure/network/azurerm"
version = "5.0.0"
</pre>

---
**9. Best Practices (Student + Interview Level)**  

- Keep modules small and focused (one purpose per module).  
- Use meaningful variable names.  
- Always provide outputs for important attributes.  
- Avoid hardcoding → use variables.  
- Use versioning when using registry modules.  
- Document each module → purpose, inputs, outputs.  
---

**LAB**




