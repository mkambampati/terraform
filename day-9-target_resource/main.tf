resource "aws_instance" "tf_ec2" {
  ami = "ami-012967cc5a8c9f891"
  instance_type = "t2.micro"
  tags = {
    Name="tf_ec2"
  }
}

resource "aws_s3_bucket" "tf_s3" {
    bucket = "targetsource.tf.kmk"
  
}