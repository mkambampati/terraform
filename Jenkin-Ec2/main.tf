resource "aws_vpc" "VPC_J" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name="VPC_J"
    }
  
}

resource "aws_subnet" "Public_Subnet" {
  vpc_id = aws_vpc.VPC_J.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name="Jenkins_Sub"
  }
}

resource "aws_internet_gateway" "IGW_J" {
    vpc_id = aws_vpc.VPC_J.id
  
}

resource "aws_route_table" "route_j" {
    vpc_id = aws_vpc.VPC_J.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IGW_J.id
    }
  
}

resource "aws_route_table_association" "Rt_ass" {
  route_table_id = aws_route_table.route_j.id
  subnet_id = aws_subnet.Public_Subnet.id
}



resource "aws_instance" "EC2_J" {
  depends_on = [ aws_iam_instance_profile.EC2_Profile, aws_security_group.Jenkins_SG ]
    subnet_id = aws_subnet.Public_Subnet.id
    ami = "ami-012967cc5a8c9f891"
    instance_type = "t2.medium"
    key_name = "terraform-key"
    iam_instance_profile = aws_iam_instance_profile.EC2_Profile.name
    vpc_security_group_ids = [ aws_security_group.Jenkins_SG.id ]
    associate_public_ip_address = true

    tags = {
      Name="Ec2_J"
    }
  
}

resource "aws_security_group" "Jenkins_SG" {
  vpc_id = aws_vpc.VPC_J.id
    name = "Jenkins_SG"
    dynamic "ingress" {
     for_each = var.ingress_rule 
     content {
       from_port = ingress.value.from_port
       to_port = ingress.value.to_port
       protocol = ingress.value.protocal
       cidr_blocks = ingress.value.cidr_block
     }
    }

    dynamic "egress" {
        for_each = var.egress_rule
        content {
          from_port = egress.value.from_port
          to_port = egress.value.to_port
          protocol = egress.value.protocal
          cidr_blocks = egress.value.cidr_block
        }
      
    }
  
}
resource "null_resource" "install_Jenkins" {
  depends_on = [aws_instance.EC2_J]

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = "terraform-key" # Path to your private key
      host        = aws_instance.EC2_J.public_ip
    }

    inline = [
      "sudo yum update -y",
      "sudo yum install git -y",
      "sudo dnf install java-17-amazon-corretto -y",
      "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
      "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key",
      "sudo yum install jenkins -y",
      "sudo systemctl enable jenkins",
      "sudo systemctl start jenkins", 
      "sudo systemctl status jenkins",
      "sudo yum install git -y",
      "sudo yum install -y yum-utils",
      "sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo",
      "sudo yum -y install terraform"

    ]
  }
}