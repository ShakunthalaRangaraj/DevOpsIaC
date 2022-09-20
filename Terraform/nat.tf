resource "aws_eip" "nat_eip" {
  vpc = true

  tags = {
    Project = "IAC"
  }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.web_sub.id

  tags = {
    Project = "IAC"
  }
}
