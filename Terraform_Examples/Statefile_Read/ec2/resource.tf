provider "aws" {
  region  = "ap-south-1"
  profile = "terraform"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "harspbucket"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    profile = "terraform"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = data.terraform_remote_state.vpc.outputs.vpc_id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "tf-example"
  }
}



resource "aws_instance" "web" {
  ami           = "ami-05695932c5299858a"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my_subnet.id

  tags = {
    Name = "HelloWorld"
  }
}
