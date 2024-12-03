resource "aws_instance" "tf_ec2" {
     ami = "ami-012967cc5a8c9f891"
    instance_type = ""
    tags = {
      Name="tf-ec2"
    }

  
}

#terraform apply  -var="instance_type=t2.micro"