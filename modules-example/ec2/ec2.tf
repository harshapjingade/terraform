provider "aws" {
  region  = "ap-south-1"
  profile = "terraform"
}

resource "aws_instance" "web" {
  ami           = "ami-05695932c5299858a"
  instance_type = "t2.micro"

  tags = {
    Name = "Ec2"
  }
}
