#Bastion Host

resource "aws_security_group" "Bastion_SG" {
    name = "Bastion_SG"
    vpc_id = aws_vpc.VPC_3_Teir.id
    depends_on = [ aws_vpc.VPC_3_Teir ]

    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "HTTP"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

resource "aws_security_group" "rds_sg" {
    name = "rds_sg"
    vpc_id = aws_vpc.VPC_3_Teir.id
    depends_on = [ aws_vpc.VPC_3_Teir ]

    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }


  
}

#Backend ALB-SG
resource "aws_security_group" "Backend_LB_SG" {
    name = "Backend_LB_SG"
    vpc_id = aws_vpc.VPC_3_Teir.id
    depends_on = [ aws_vpc.VPC_3_Teir ]

    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks=["0.0.0.0/0"]
    }

    ingress {
        description = "HTTPS"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name="Backend_LB_SG"
    }
  
}