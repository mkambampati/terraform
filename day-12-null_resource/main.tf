resource "aws_instance" "tf_ec2" {
    ami = "ami-012967cc5a8c9f891"
    instance_type = "t2.micro"
    for_each = toset(var.instances) 
    tags = {
      Name=each.value
    }

    
  
}

variable "instances" {
    description = "Type of environments to launch the EC2 instances"
    type = list(string)
    default = [ "dev", "test" ]
  
}