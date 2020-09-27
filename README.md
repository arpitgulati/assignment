There are 2 folder terraform and ansible
To run terraform first initialize the s3 backend using below command
terraform init -reconfigure -backend-config=./remote_backend.tfvars
Terraform to see you didn't get any error and then terraform plan 
If everythings looks good , then terraform apply

Ansible: create a inventory file , then run the command
ansible-playbook -i inventory/pre-production elasticsearch.yml -u ubuntu --vault-pass vault_pass.txt --extra-vars="env=pre-producti
on" --private-key=~/keys/elastic-pre-production.pem --tags="java,elasticsearch".

Above is just an example to run playbook
Also create a vault_pass.txt . 
