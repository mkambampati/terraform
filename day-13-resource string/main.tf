variable "create_instance" {
    description = "set to true to create the EC2 instance"
    type = bool
    default = true
  
}

resource "random_string" "instance_name" {
  count = var.create_instance ? 2:0
  length = 5
  special = true
  upper = true
}

resource "aws_instance" "tf_ec2" {
    count = var.create_instance ? 2:0
     ami = "ami-012967cc5a8c9f891"
    instance_type = "t2.micro"
    tags = {
      Name="Random_instance.${random_string.instance_name[count.index].id}"
    }

  
}