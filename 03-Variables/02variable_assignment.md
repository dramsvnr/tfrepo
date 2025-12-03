**Terraform Variable Assignment Methods**

---
**Method 1 — Passing Variables via CLI**
You can pass values directly at the command line with the `-var` flag.
✔ Run a plan with CLI variables — pass the values directly:
```hcl
terraform plan -var "rgname=techlines-dev-rg" -var "rglocation=centralUS"
```
✔ Apply with CLI variables:
```hcl
terraform apply -var "rgname=techlines-dev-rg" -var "rglocation=centralUS"
```
✔ Destroy with CLI variables:
```hcl
terraform destroy -var "rgname=techlines-dev-rg" -var "rglocation=centralUS"
```
**📌 Conclusion**  
**If you specify variables with `-var` on the command line, Terraform uses these values instead of prompting for input.**


**Method 2 — Variable Definition Files**

These variable definition files are auto loaded
 - terraform.tfvars
 - terraform.tfvars.json
 - *.auto.tfvars
 - *.auto.tfvars.json

All other definitionfiles should be passed along like below
```hcl
terraform plan -var-file 'dev_env.tfvars'
```
--
✔ Use a default file like `terraform.tfvars` or any `*.auto.tfvars`:Terraform will look for these automatically.
```hcl
terraform plan
terraform apply
```

✔ Use a custom `.tfvars` file — specify with `-var-file`:
```hcl
terraform plan -var-file="dev_env.tfvars"
terraform apply -var-file="dev_env.tfvars"
terraform destroy -var-file="dev_env.tfvars"
```
**📌 Conclusion**  
**If you provide a `.tfvars` file or use a default variable definition file, Terraform uses values from those files without prompting.**


**Method 3 — Environment Variables**

Terraform can also read variables from your environment.

✔ Export variable(s) using the `TF_VAR_` prefix:
**Bash/macOS/Linux:**
```sh
export TF_VAR_rglocation="centralus"
export TF_VAR_rgname="techlines-dev-rg"
```
**PowerShell:**
```powershell
$env:TF_VAR_rgname="techlines-dev-rg"
$env:TF_VAR_rglocation="centralus"
```
Then run Terraform as usual:
```hcl
terraform plan
terraform apply
```
**📌 Conclusion**  
**If you set environment variables prefixed with `TF_VAR_`, Terraform uses these for variable values and does not prompt for input.**

---

**💡 Variable Definition Precedence (Highest → Lowest)**
1. `-var` or `-var-file` (CLI)
2. any *.auto.tfvars or *.auto.tfvars.json files in lexical order
3. The terraform.tfvars.json file
4. The terraform.tfvars file
5. Environment variables
6. The default argument of the variable block


