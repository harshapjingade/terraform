provider "aws" {
  region  = "ap-south-1"
  profile = "terraform"
}

terraform {
  backend "s3" {
    bucket  = "harspbucket"
    key     = "terraform.tfstate"
    region  = "ap-south-1"
    profile = "terraform"
  }
}

resource "aws_vpc" "new" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "New"
  }
}

output "vpc_id" {
  value = aws_vpc.new.id
}
