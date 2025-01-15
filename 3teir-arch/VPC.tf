resource "aws_vpc" "VPC_3_Teir" {
    cidr_block = "192.168.0.0/16"
    tags = {
      Name = "VPC_3_teir"
    }
  
}

resource "aws_subnet" "pub_1a" {
    vpc_id = aws_vpc.VPC_3_Teir.id
    cidr_block = "192.168.0.0/19"
    tags = {
      Name="pub_1a"
    }
  
}

resource "aws_subnet" "pub_2b" {
    vpc_id = aws_vpc.VPC_3_Teir.id
    cidr_block = "192.168.32.0/19"
    tags = {
      Name="pub_2b"
    }
  
}

resource "aws_subnet" "pvt_3a" {
    vpc_id = aws_vpc.VPC_3_Teir.id
    cidr_block = "192.168.64.0/19"
    tags = {
      Name="pvt_3a"
    }
  
}

resource "aws_subnet" "pvt_4b" {
    vpc_id = aws_vpc.VPC_3_Teir.id
    cidr_block = "192.168.96.0/19"
    tags = {
      Name="pvt_4b"
    }
  
}

resource "aws_subnet" "pvt_5a" {
    vpc_id = aws_vpc.VPC_3_Teir.id
    cidr_block = "192.168.128.0/19"
    tags = {
      Name="pvt_5a"
    }
  
}

resource "aws_subnet" "pvt_6b" {
    vpc_id = aws_vpc.VPC_3_Teir.id
    cidr_block = "192.168.160.0/19"
    tags = {
      Name="pvt_6b"
    }
  
}


resource "aws_subnet" "pvt_7a" {
    vpc_id = aws_vpc.VPC_3_Teir.id
    cidr_block = "192.168.192.0/19"
    tags = {
      Name="pvt_7a"
    }
  
}

resource "aws_subnet" "pvt_8b" {
    vpc_id = aws_vpc.VPC_3_Teir.id
    cidr_block = "192.168.224.0/19"
    tags = {
      Name="pvt_8b"
    }
  
}

resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.VPC_3_Teir.id
    tags = {
      Name="IGW"
    }
  
}

resource "aws_eip" "EIP" {
  
}

resource "aws_nat_gateway" "NAT" {
 subnet_id = aws_subnet.pub_1a.id
 allocation_id = aws_eip.EIP.id
 tags = {
   Name="NAT_GW"
 }
  
}

resource "aws_route_table" "pub_rt" {
    vpc_id = aws_vpc.VPC_3_Teir.id
    route  {
        cidr_block ="0.0.0.0/0"
        gateway_id = aws_internet_gateway.IGW.id

    }
  tags = {
    Name="pub-rt"
  }
}

resource "aws_route_table_association" "pub_1a_ras" {
  route_table_id = aws_route_table.pub_rt.id
  subnet_id = aws_subnet.pub_1a.id

  
}

resource "aws_route_table_association" "pub_1b_ras" {
  route_table_id = aws_route_table.pub_rt.id
  subnet_id = aws_subnet.pub_2b.id
  
}

resource "aws_route_table" "pvt_rt" {
  vpc_id = aws_vpc.VPC_3_Teir.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NAT.id
  }
  
}

resource "aws_route_table_association" "pvt_3a_ras" {
  route_table_id = aws_route_table.pvt_rt.id
  subnet_id = aws_subnet.pvt_3a.id
  
}

resource "aws_route_table_association" "pvt_4b_ras" {
  route_table_id = aws_route_table.pvt_rt.id
  subnet_id = aws_subnet.pvt_4b.id
  
}

resource "aws_route_table_association" "pvt_5a_ras" {
  route_table_id = aws_route_table.pvt_rt.id
  subnet_id = aws_subnet.pvt_5a.id
  
}

resource "aws_route_table_association" "pvt_6b_ras" {
  route_table_id = aws_route_table.pvt_rt.id
  subnet_id = aws_subnet.pvt_6b.id
  
}

resource "aws_route_table_association" "pvt_7a_ras" {
  route_table_id = aws_route_table.pvt_rt.id
  subnet_id = aws_subnet.pvt_7a.id
  
}

resource "aws_route_table_association" "pvt_8b_ras" {
  route_table_id = aws_route_table.pvt_rt.id
  subnet_id = aws_subnet.pvt_8b.id
  
}




