locals {
  ami="ami-012967cc5a8c9f891"
  instance_type="t2.micro"
  tags="tf-ec2"
}




resource "aws_instance" "tf_ec2" {
     ami = local.ami
    instance_type = local.instance_type
    tags = {
      Name=local.tags
    }

  
}