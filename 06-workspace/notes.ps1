#this will initialize the folder
terraform init
#this validates the code
terraform validate
# you can see default in workspace list
terraform workspace list
#creates new dev workspace 
terraform workspace new dev
#lets check workspace list
terraform workspace list
#if dev is not selected as workspace run select cmd
terraform workspace select dev
#create new prod workspace
terraform workspace new prod
# to check current workspace use show cmd
terraform workspace show
terraform workspace list
terraform workspace select dev
terraform apply -var-file dev.tfvars
terraform workspace select prod
terraform apply -var-file prod.tfvars
#===========================
#cleanup the resources after lab
terraform destroy -var-file prod.tfvars 
terraform workspace list
terraform workspace delete prod
terraform workspace select dev
terraform workspace delete prod
terraform destroy -var-file dev.tfvars
terraform workspace select default
terraform workspace list
terraform workspace delete dev