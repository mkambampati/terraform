resource "aws_instance" "tf_ec2" {
    ami="ami-012967cc5a8c9f891"
    instance_type = "t2.nano"
    availability_zone = "us-east-1a"
    tags = {
      Name="tf-ec2"
    }
  #lifecycle {
    #prevent_destroy = true
  #}

  lifecycle {
    ignore_changes = [ instance_type ]
  }

  #lifecycle {
    #create_before_destroy = true
  #}
}

