resource "aws_vpc" "tf_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name="tf_vpc"
  }
}

resource "aws_subnet" "tf_subnet" {
    vpc_id = aws_vpc.tf_vpc.id
    cidr_block = "10.0.0.0/20"
    tags = {
      Name="tf_subnet"
    }
}

resource "aws_internet_gateway" "tf_igw" {
    vpc_id = aws_vpc.tf_vpc.id
    tags = {
      Name="tf_igw"
    }
  
}

resource "aws_route_table" "tf_route" {
    vpc_id = aws_vpc.tf_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.tf_igw.id
    }
    tags = {
        Name="tf_route"
    }
}

resource "aws_route_table_association" "tf_assoc" {
    route_table_id = aws_route_table.tf_route.id
    subnet_id = aws_subnet.tf_subnet.id
  
}