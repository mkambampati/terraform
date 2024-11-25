resource "aws_instance" "first_ec2_instance" {
  ami = var.ami_name
  instance_type = var.instance_ty
  key_name=var.key_pair
  tags = {
    name="Hrithvik"
  }
}

terraform {
backend "s3" {
  bucket = "tfstate.kmk"
  region = "us-east-1"
  encrypt = true
  key = "day-2/terraform.tfstate"
  
}
}