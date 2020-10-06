# VARIABLES
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "private_key_path" {}
variable "key_name" {}
variable "region" {}
variable "vpc_address_space" {
  type = string
}
variable "subnet1_address_space" {
  type = string
}
variable "subnet2_address_space" {
  type = string
}