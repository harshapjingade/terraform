# terraform
Please follow the below steps to configure terraform with AWS and creating instance.

Step1: aws configure --profile terraform

#provide the values:

AWS Access Key ID [None]: <Access Key Id>
AWS Secret Access Key [None]: <Secret Access Key>
Default region name [None]: <Region>
Default output format [None]: json

Step2: terraform apply provider_aws.tf 

Step3: terraform init // download and install plugin based on cloud provider

Step4: terraform apply main_aws.tf // deploying instance

Few commands:

terraform fmt // formatting the information provided 

terraform plan // dry run

terraform apply // to deploy

terraform destroy //  to remove
