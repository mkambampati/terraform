resource "aws_instance" "Bastion" {
    ami="ami-09115b7bffbe3c5e4"
    instance_type = "t2.micro"
    key_name = "slave"
    #provider we can include if it is not a default region
    vpc_security_group_ids = [aws_security_group.Bastion_SG.id]
    subnet_id = aws_subnet.pub_1a.id
    tags = {
      Name="Bastion_Host"
    }
    
  
}