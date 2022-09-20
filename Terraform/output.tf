output "ec2_public_ip" {
  value = aws_instance.appserver.public_ip
  }
