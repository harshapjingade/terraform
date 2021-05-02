provider "aws" {
  region  = var.region
  profile = var.profile
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = "harsp instance"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > public_ip.txt"

  }
}
