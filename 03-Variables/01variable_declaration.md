**VARIABLES IN TERRAFORM**   
---
**What is a Variable ?**

A variable in Terraform is **simply a placeholder** for a value — like a **reusable input** that you can change without editing your Terraform code.

**Why do we use variables?**

To **avoid hard-coding** values.To **reuse the same configuration in different environments**.

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

**validation example**
The validation block lets you enforce that a variable value meets your specific requirements
```hcl
variable "image_id" {
  type        = string
  description = "The ID of the machine image (AMI) to use for the server."

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI ID, starting with \"ami-\"."
  }
}
```
**ephimeral example**
The ephemeral argument makes a variable available during runtime, but Terraform omits ephemeral values from state and plan files. The ephemeral argument is useful for values that only exist temporarily, such as a short-lived token or session identifier.
```hcl
variable "access_key" {
  description = "AWS access key"
  type     = string
  ephemeral = true
}

variable "secret_key" {
  description = "AWS sensitive secret key."
  type     = string
  sensitive = true
  ephemeral = true
}

variable "session_token" {
  description = "AWS session token."
  type     = string
  sensitive = true
  ephemeral = true
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  token      = var.session_token
}
```
**sensentive**
The sensitive argument prevents Terraform from showing a variable block's value in CLI output when you use that variable in your configuration.
```hcl
variable "user_password" {
  type      = string
  sensitive = true
}
```

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
