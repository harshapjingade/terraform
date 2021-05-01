output "instance_ip" {
  value = aws_instance.web["prod"].public_ip
}