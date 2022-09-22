resource "aws_instance" "appserver" {
  ami           = "ami-090fa75af13c156b4"
  instance_type = var.instance_type
  key_name      = "ec2_ansible"

  subnet_id              = aws_subnet.web_sub.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Project = "IAC"
  }
}

#IP of aws instance copied to a file ip.txt in local system
resource "local_file" "app_ip" {
    content  = aws_instance.appserver.public_ip
    filename = "ip.txt"
}

resource "aws_instance" "webserver" {
  ami           = "ami-090fa75af13c156b4"
  instance_type = var.instance_type
  key_name      = "ec2_ansible"

  subnet_id              = aws_subnet.app_sub.id
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = {
    Project = "IAC"
  }
  

}

#IP of aws instance copied to a file ip.txt in local system
resource "local_file" "web_ip" {
    content  = aws_instance.webserver.public_ip
    filename = "ip.txt"
}

resource "aws_instance" "dbserver" {
  ami           = "ami-090fa75af13c156b4"
  instance_type = var.instance_type
  key_name      = "ec2_ansible"

  subnet_id              = aws_subnet.db_sub.id
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  tags = {
    Project = "IAC"
  }
}

#IP of aws instance copied to a file ip.txt in local system
resource "local_file" "db_ip" {
    content  = aws_instance.dbserver.public_ip
    filename = "ip.txt"
}

