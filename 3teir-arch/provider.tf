provider "aws" {
    region = "us-east-1"
  
}

provider "aws" {
    alias = "secoundary"
    region = "us-west-2"
  
}