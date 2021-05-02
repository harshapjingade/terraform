provider "aws" {
  region  = var.region
  profile = var.profile
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = "Terraform"
  tags = {
    Name = "harsp instance"
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("Terraform.pem")
    timeout     = "4m"
  }

  provisioner "file" {
    source      = "Test.txt"
    destination = "/home/ubuntu/Test.txt"

  }
}

