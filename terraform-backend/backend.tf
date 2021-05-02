terraform {
  backend "s3" {
    bucket  = "harspbucket"
    region  = "ap-south-1"
    key     = "terrraform.tfstate"
    profile = "terraform"
  }
}