**What we covered yesterday**
- What is Variables
- Variable declaration
- Variable assignments
- Variable Types

***Day4:Topics***
1. outputs
2. locals
---
**1.output**
- Terraform outputs are like results you want Terraform to show you after it finishes creating resources.
👉 Think of them as final values you want to display — such as resource names, IP addresses, URLs, or IDs.

**2.locals**
- Terraform locals are like temporary named values you create to reuse within your configuration.
- They help you:
✔ avoid repeating the same value in many places
✔ make your code cleaner and easier to maintain

👍 Simple Example

Instead of writing "westus2" in 10 places,
you create a local value:
```hcl
locals {
  location = "westus2"
}
```
Then you reuse it like:
```hcl
location = local.location
```
In simple words:
Terraform locals are reusable values you define once and use many times inside your project.

**Lab** 
- output
- locals


