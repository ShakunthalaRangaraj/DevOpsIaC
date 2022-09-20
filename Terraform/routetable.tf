resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Project = "IAC"
  }
}

resource "aws_route_table_association" "rt_assoc" {
  subnet_id      = aws_subnet.web_sub.id
  route_table_id = aws_route_table.pub_rt.id
}


resource "aws_route_table" "prv_rt" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Project = "IAC"
  }
}

resource "aws_route_table_association" "prv_rt_assoc1" {
  subnet_id      = aws_subnet.app_sub.id
  route_table_id = aws_route_table.prv_rt.id
}

resource "aws_route_table_association" "prv_rt_assoc2" {
  subnet_id      = aws_subnet.db_sub.id
  route_table_id = aws_route_table.prv_rt.id
}
