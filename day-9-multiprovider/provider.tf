provider "aws" {
    region = "us-east-1"
  
}

provider "aws" {
    region = "ap-south-1"
    alias = "mum"
  
}