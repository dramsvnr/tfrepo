**What is a Variable ?**

A variable in Terraform is simply a placeholder for a value — like a reusable input that you can change without editing your Terraform code.

**Why do we use variables?**

✔ To avoid hard-coding values  
✔ To reuse the same configuration in different environments  
✔ To centralize settings like names, regions, or sizes  
---
**Variable Block declaration**

```hcl
variable "<LABEL>" {
  type        = <TYPE>
  default     = <DEFAULT_VALUE>
  description = "<DESCRIPTION>"
  sensitive   = <true|false>
  nullable    = <true|false>
  ephemeral   = <true|false>

  validation {
    condition     = <EXPRESSION>
    error_message = "<ERROR_MESSAGE>"
  }
}
```
## Terraform Variable Argument Overview

| **Argument** | **Description** | **Type** | **Required?** |
|--------------|-----------------|----------|---------------|
| `type` | Specify a type constraint for the value of this variable. | Type constraint | Optional |
| `default` | Sets the default value. If missing, a value must be provided. | Expression | Optional |
| `description` | Human-readable explanation of purpose/value. | String | Optional |
| `validation` | Defines additional validation rules for variable values. | Block | Optional |
| `sensitive` | Hides value from CLI output. | Boolean | Optional |
| `nullable` | Whether variable value can be `null`. | Boolean | Optional |
| `ephemeral` | Prevent storing this value in state or plan files. | Boolean | Optional |

---

**LAB 1 — Empty Variable Block (Interactive Input)**

When a variable block has **no default value**, Terraform will **prompt for input**.
✔ Initialize Terraform:  
```hcl
terraform init
```
✔ Run a plan — it will prompt for values:
```hcl
terraform plan
```
✔ Try apply — again Terraform will ask for values:
```hcl
terraform apply
```
**📌 Conclusion**  
**If a variable block has no default value, Terraform runs in interactive mode asking for inputs.**
