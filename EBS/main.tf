resource "aws_ebs_volume" "tf_ebs" {
    availability_zone = "us-east-1a"
    type = "gp2"
    size = 10
    encrypted = true
    tags = {
      Name="tf_ebs"
    }

}

resource "aws_instance" "tf_ec2" {
    ami = "ami-012967cc5a8c9f891"
    instance_type = "t2.micro"
    key_name = "terraform-key"
    tags = {
      Name="tf_ec2"
    }
  
}

resource "aws_volume_attachment" "tf_vol_attch" {
    volume_id = aws_ebs_volume.tf_ebs.id
    instance_id = aws_instance.tf_ec2.id
    device_name = "/dev/sdh"
  
}