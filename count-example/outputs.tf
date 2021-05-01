output "Instance_Private_ip" {
  value = aws_instance.web[*].private_ip
}

output "Instance_id" {
  value = [for instance in aws_instance.web : instance.id]
}