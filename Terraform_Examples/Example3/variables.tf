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
variable "billing_code_tag" {}
variable "environment_tag" {}
variable "bucket_name_prefix" {}


# LOCALS


locals {
  common_tags = {
    BillingCode = var.billing_code_tag
    Environment = var.environment_tag
  }

  s3_bucket_name = "${var.bucket_name_prefix}-${var.environment_tag}-${random_integer.rand.result}"
}

