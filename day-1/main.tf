resource "aws_instance" "first_ec2_instance" {
  ami = var.ami_name
  instance_type = var.instance_ty
  key_name=var.key_pair
  tags = {
    name="Hrithvik"
  }
}