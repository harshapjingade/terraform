resource "aws_s3_bucket" "bucket" {
  bucket = "harspbucket-module"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
