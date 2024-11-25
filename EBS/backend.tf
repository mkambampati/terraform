terraform {
  backend "s3" {
    bucket = "tfstate.kmk"
    key="EBS/terraform.tfstate"
    encrypt = true
    region = "us-east-1"

  }
}