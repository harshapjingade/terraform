provider "aws" {
  region  = var.region
  profile = var.profile
}

locals {
	name = "${terraform.workspace}-instance"
}

resource "aws_instance" "main" {
	ami           = var.ami
	instance_type = var.instance_type

	tags = {
		Name = local.name
	}
}