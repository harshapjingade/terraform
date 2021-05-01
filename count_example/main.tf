provider "aws" {
  profile = "terraform"
  region  = var.region
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
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
}

resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.new.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone

}

resource "aws_security_group" "sgweb" {
  name        = "vpc_test_web"
  description = "Allow incoming HTTP connections & SSH access"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = aws_vpc.new.id

}

resource "aws_instance" "web" {
  count                  = var.instance_count
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public-subnet.id
  vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
  tags = {
    Name = "Dev ${count.index}"
  }
}

