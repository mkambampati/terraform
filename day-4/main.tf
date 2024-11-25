resource "aws_vpc" "tf_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name="tf_vpc"
    }
}
resource "aws_subnet" "tf_public_1" {
    vpc_id = aws_vpc.tf_vpc.id
    cidr_block = "10.0.128.0/18"
    tags = {
      Name="tf_publi_1"
    }
  
}

resource "aws_subnet" "tf_public_2" {
    vpc_id = aws_vpc.tf_vpc.id
    cidr_block = "10.0.192.0/18"
    tags = {
      Name="tf_public_2"
    }
  
}

resource "aws_subnet" "tf_private" {
  vpc_id = aws_vpc.tf_vpc.id
  cidr_block = "10.0.64.0/18"
  tags = {
    Name="tf_private"
  }
}

resource "aws_internet_gateway" "tf_igw" {
    vpc_id = aws_vpc.tf_vpc.id
    tags = {
      Name="tf_igw"
    }
  
}
resource "aws_eip" "tf_eip" {
  depends_on = [ aws_internet_gateway.tf_igw ]
  
}
resource "aws_nat_gateway" "tf_nat" {
  allocation_id = aws_eip.tf_eip.id
  subnet_id = aws_subnet.tf_public_2.id
  depends_on = [ aws_eip.tf_eip ]
  tags = {
    Name="tf_nat"
  }
}
resource "aws_route_table" "tf_route_igw" {
    vpc_id = aws_vpc.tf_vpc.id
    route  {
        cidr_block="0.0.0.0/0"
        gateway_id = aws_internet_gateway.tf_igw.id
    }
    tags = {
      Name="tf_route_igw"
    }
}

resource "aws_route_table_association" "tf_igw_public_1" {
    route_table_id = aws_route_table.tf_route_igw.id
    subnet_id = aws_subnet.tf_public_1.id
  
}

resource "aws_route_table" "tf_route_nat" {
  vpc_id = aws_vpc.tf_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.tf_nat.id
  }
  tags = {
    Name="tf_route_nat"
  }
}

resource "aws_route_table_association" "tf_nat_private" {
  route_table_id = aws_route_table.tf_route_nat.id
  subnet_id = aws_subnet.tf_private.id
  
}