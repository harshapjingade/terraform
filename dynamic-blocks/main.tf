provider "aws" {
  region  = var.region
  profile = var.profile
}
/*
locals {
  ingress_rules = [80, 443]
}
*/

locals {
  ingress_rules = [
    {
        port     = 80
        protocol = "tcp"
    },
    {
        port     = 22
        protocol = "udp"
  }]
}

data "aws_vpc" "default" {
  default = true
}

/*resource "aws_security_group" "main" {
  name   = "harsp-sg"
  vpc_id = data.aws_vpc.default.id

  dynamic "ingress" {
    for_each = local.ingress_rules

    content {
      from_port  = ingress.value
      to_port    = ingress.value
      protocol   = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
  tags = {
		Name = "harsp security group"
	}
}
*/

resource "aws_security_group" "main" {
  name   = "harsp-sg"
  vpc_id = data.aws_vpc.default.id
  dynamic "ingress" {
    for_each = local.ingress_rules
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  tags = {
    Name = "harsp security group"
  }
}
