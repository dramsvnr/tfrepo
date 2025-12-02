#empty variable blk declaration
# No default value
#run terraform init to initialize terraform in 01lab
terraform init
#run terraform plan
# Observer it will prompt for values
# ctrl+c to come out of the prompt
terraform plan
#try terraform apply
# Observer it will also prompt for values
# ctrl+c to come out of the prompt
terraform apply

#conclusion: if you dont pass default value and keep the block empty it will prompt for each value 
#it will be interactive mode
