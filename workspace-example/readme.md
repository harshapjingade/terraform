terraform workspace list // to list the workspace

terraform workspace new dev // creating dev workspace

terraform workspace new prod // creatinf prod workspace

terraform workspace select dev // switching to dev workspace

terraform workspace show // currently on which workspace

terraform plan -var-file=dev.tfvars // running plan for dev workspace

terraform apply -var-file=deve.tfvars -auto-approve // running apply for dev workspace

terraform workspace select prod // switching to prod workspace

terraform plan -var-file=dev.tfvars // running plan for prod workspace

terraform apply -var-file=deve.tfvars -auto-approve // running apply for prod workspace