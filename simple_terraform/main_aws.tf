resource "aws_instance" "my_instance" {
  ami           = "ami-05695932c5299858a"
  instance_type = "t2.micro"
  tags = {
    Name = "Created via terraform"
  }
}
