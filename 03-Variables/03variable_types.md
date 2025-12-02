**Terraform Variable Types with Azure Examples**
**1. String Variable**


---
**1. String Variable**
 — Azure Region Example**
 ```hcl
variable "azure_region" {
  description = "Azure region to deploy resources in"
  type        = string
  default     = "eastus"
}
```

✔ Holds plain text values like names, IDs, or paths  
✔ Use when input must be a single text value  



**2. Number Variable — Azure VM Count Example**

✔ Represents numeric values (integer or float)  
✔ Useful for counts, sizes, thresholds, ports  
✔ Example: `3`, `8080`, `1.5`  
```hcl
variable "vm_count" {
  description = "Number of Azure VMs to deploy"
  type        = number
  default     = 2
}
```

**3. Boolean Variable — Enable Azure Diagnostics**

✔ Holds `true` or `false`  
✔ Used for feature flags or conditional logic  
✔ Example: `true` to enable logging  
```hcl
variable "enable_diagnostics" {
  description = "Enable boot diagnostics on Azure VM"
  type        = bool
  default     = true
}
```

**4. List Variable — List of Azure Subnets**

✔ Ordered collection of values  
✔ Used when multiple items are expected in sequence  
✔ Example: `["eastus", "westus"]`  
```hcl
variable "subnet_names" {
  description = "List of subnet names to create in VNet"
  type        = list(string)
  default     = [
    "subnet-app",
    "subnet-db",
    "subnet-web"
  ]
}
```

**4.1 Set Variable — Unique Azure Tags**

✔ Similar to list but unordered  
✔ Does not allow duplicate values  
✔ Good for unique tag collections  
✔ Example: `["dev", "backend", "dev"]` (duplicate automatically removed)  
```hcl
variable "env_tags" {
  type    = set(string)
  default = ["dev", "backend", "dev"]
}
```

**5. Map Variable — Tags for Azure Resources**

✔ Key-value dictionary  
✔ Useful for central tag input or structured settings  
✔ Example: `{ environment = "dev", project = "billing-app", owner = "cloud-team" }`  
```hcl
variable "resource_tags" {
  description = "Tags to apply to all Azure resources"
  type        = map(string)
  default     = {
    environment = "dev"
    project     = "billing-app"
    owner       = "cloud-team"
  }
}
```

**6. Object Variable — Azure Storage Account Configuration**

✔ Collection of named attributes with defined types  
✔ Ideal for complex structured configurations  
✔ Example: `{ account_tier = "Standard", account_replication_type = "LRS", enable_https_traffic = true }`  
```hcl
variable "storage_config" {
  description = "Configuration for Azure Storage Account"
  type = object({
    account_tier             = string
    account_replication_type = string
    enable_https_traffic     = bool
  })
  default = {
    account_tier             = "Standard"
    account_replication_type = "LRS"
    enable_https_traffic     = true
  }
}
```

**7. Tuple Variable — Mixed Azure Inputs**

✔ Fixed-length ordered values  
✔ Each position can have a different type  
✔ Example: `["Basic", "Standard_B2ms", 3]`  
```hcl
variable "mixed_values" {
  description = "Tuple containing Azure SKU, VM size, and instance count"
  type        = tuple([string, string, number])
  default     = ["Basic", "Standard_B2ms", 3]
}
```

**8. Any Type — Flexible Input Type**

✔ Accepts any type (`string`, `number`, `list`, `map` etc.)  
✔ Good when flexibility is required  
✔ Often used for secrets or dynamic inputs  
✔ Example: Marking as sensitive for secret values  
```hcl
variable "client_secret" {
  description = "Azure AD Application Client Secret"
  type        = any
  sensitive   = true
}
```