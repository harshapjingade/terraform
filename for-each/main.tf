provider "aws" {
  region  = var.region
  profile = var.profile
}

resource "aws_instance" "web" {
  for_each = {
    prod = "t2.micro"
    dev  = "t2.nano"
  }
  ami           = var.ami
  instance_type = each.value

  tags = {
    Name = each.key
  }
}

