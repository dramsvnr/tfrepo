**Terraform Variable Assignment Methods**

**Method 1 — Empty Variable Block (Interactive Input)**

When a variable block has **no default value**, Terraform will **prompt for input**.

Steps

✔ Initialize Terraform:  
```hcl terraform init ```
✔ Run a plan — it will prompt for values:
```terraform plan
✔ Try apply — again Terraform will ask for values:

bash
Copy code
terraform apply
📌 Conclusion
If a variable block has no default value, Terraform runs in interactive mode asking for inputs.

Method 2 — Passing Variables via CLI
You can pass values directly using the -var flag:

bash
Copy code
terraform plan -var "rgname=techlines-dev-rg" -var "rglocation=centralUS"
terraform apply -var "rgname=techlines-dev-rg" -var "rglocation=centralUS"
terraform destroy -var "rgname=techlines-dev-rg" -var "rglocation=centralUS"
Method 3 — Variable Definition Files
Terraform automatically loads the following files:

✔ terraform.tfvars
✔ terraform.tfvars.json
✔ *.auto.tfvars
✔ *.auto.tfvars.json

Other .tfvars files must be passed manually:

bash
Copy code
terraform plan -var-file="dev_env.tfvars"
terraform apply -var-file="dev_env.tfvars"
terraform destroy -var-file="dev_env.tfvars"
Method 4 — Environment Variables
Terraform reads variables exported with the prefix TF_VAR_.

Example
PowerShell:
bash
Copy code
$env:TF_VAR_rgname="techlines-dev-rg"
$env:TF_VAR_rglocation="centralus"
Bash/macOS/Linux:
bash
Copy code
export TF_VAR_rglocation="centralus"
Now run:

bash
Copy code
terraform plan
terraform apply
Variable Definition Precedence (Highest → Lowest)
1️⃣ -var or -var-file
2️⃣ *.auto.tfvars
3️⃣ terraform.tfvars
4️⃣ Environment variables (export / $env:)

