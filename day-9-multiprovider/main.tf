resource "aws_instance" "ec2_vir" {
    ami = "ami-012967cc5a8c9f891"
    instance_type = "t2.micro"
    tags = {
      Name="ec2_vir"
    }
  
}

resource "aws_instance" "ec2_mum" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    provider = aws.mum
    tags = {
      Name="ec2_mum"
    }
  
}