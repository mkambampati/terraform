resource "aws_vpc" "VPC_J" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name="VPC_J"
    }
  
}

resource "aws_subnet" "Public_Subnet" {
  vpc_id = aws_vpc.VPC_J.id
  cidr_block = "10.0.192.0/18"
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


resource "aws_instance" "flask_app" {
  depends_on = [ aws_security_group.flask_app_sg ]
  subnet_id = aws_subnet.Public_Subnet.id
  ami           = "ami-012967cc5a8c9f891" # Replace with a valid Amazon Linux 2 AMI for your region
  instance_type = "t2.micro"
  key_name="terraform-key"
    vpc_security_group_ids = [aws_security_group.flask_app_sg.id]
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install python3 -y
              pip3 install flask
              echo "${file("${path.module}/app.py")}" > /home/ec2-user/app.py
              nohup python3 /home/ec2-user/app.py &
              EOF

  tags = {
    Name = "FlaskApp"
  }
}

resource "aws_security_group" "flask_app_sg" {
  name        = "flask_app_security_group"
  description = "Allow HTTP and SSH traffic"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere (Restrict this in production)
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP from anywhere
  }
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP from anywhere
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "FlaskAppSG"
  }
}


output "instance_ip" {
  value = aws_instance.flask_app.public_ip
}