provider "aws" {
  region  = "ap-south-1"
  profile = "terraform"
}
module "ec2" {
  source = "./ec2"
}

module "s3" {
  source = "./s3"
}
