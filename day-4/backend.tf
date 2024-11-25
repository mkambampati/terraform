terraform {
  backend "s3" {
    bucket = "tfstate.kmk"
    region = "us-east-1"
    key = "day-4/terrform.tfstate"
    encrypt = true
    dynamodb_table = "tffile_lock_kmk"
    
  }
}