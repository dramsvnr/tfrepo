terraform init
terraform plan
terraform apply -auto-approve
#----------------------------------
#Verify the Provisioners Worked
#Check local-exec output:

#SSH into VM:
ssh azureuser@4.157.246.187
ls -lrt
pwd

#Check remote-exec commands executed:
sudo systemctl status nginx
cd /var/www/html
cat /var/www/html/index.html






