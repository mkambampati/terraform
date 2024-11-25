terraform {
  backend "s3" {
    bucket="tfstate.kmk"
    region="us-east-1"
    key="day-3/terraform.tfstate"
    encrypt = true
    
  }
}