#Code with count
resource "aws_instance" "tf_ec2" {
    ami="ami-012967cc5a8c9f891"
    instance_type="t2.micro"
    count=length(var.instances)
    tags = {
      Name=var.instances[count.index]
    }
  
}

#Code with for-each
resource "aws_instance" "tf_ec2_for" {
    ami = "ami-012967cc5a8c9f891"
    instance_type = "t2.micro"
    for_each = toset(var.instances)
    tags = {
      Name=each.value
    }
  
}
variable "instances" {
    description = "List of instances to be deployed"
    type = list(string)
    default = [ "dev", "test", "prod" ]
  
}