resource "aws_subnet" "web_sub" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = "172.16.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Project = "IAC"
  }
}

resource "aws_subnet" "app_sub" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = "172.16.4.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Project = "IAC"
  }
}

resource "aws_subnet" "db_sub" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = "172.16.5.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Project = "IAC"
  }
}
