provider "aws" {
  region  = "ap-south-1"
  profile = "terraform"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

module "webserver" {
  source        = "./modules"
  vpc_id        = aws_vpc.main.id
  name          = "harsp sevrer"
  cidr_block    = "10.0.1.0/24"
  ami           = "ami-05695932c5299858a"
  instance_type = "t2.micro"
}

output "instance_details" {
  value = module.webserver.instance.id
}