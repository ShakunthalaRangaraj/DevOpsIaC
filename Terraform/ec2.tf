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

resource "aws_instance" "webserver" {
  ami           = "ami-090fa75af13c156b4"
  instance_type = var.instance_type
  key_name      = "ec2_ansible"

  subnet_id              = aws_subnet.app_sub.id
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = {
    Project = "IAC"
  }
  
provisioner "remote-exec" {command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu -i '${self.ipv4_address},' -e 'pub_key=ec2_ansible.pem' webapp.yml"}
  
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
