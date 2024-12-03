variable "create_instance" {
    description = "set to true to create the EC2 instance"
    type = bool
    default = true
  
}

resource "aws_instance" "tf_ec2" {
    count = var.create_instance ? 2:0
     ami = "ami-012967cc5a8c9f891"
    instance_type = "t2.micro"
    # for_each = toset(var.instances) 
    tags = {
      Name="tf_ec2"
    }

  
}

# variable "instances" {
#     type = list(string)
#     default = [ "dev", "prod" ]
  
# }