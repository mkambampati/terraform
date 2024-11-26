data "aws_availability_zone" "dt_sub" {
    name = "us-east-1b"
}

data "aws_ec2_instance_type" "dt_instance" {
   instance_type = "t2.micro"
  
}
resource "aws_instance" "tf_ec2" {
  ami="ami-012967cc5a8c9f891"
  instance_type = data.aws_ec2_instance_type.dt_instance.id
  availability_zone = data.aws_availability_zone.dt_sub.id
  tags = {
    Name="tf_ec2"
  }
}