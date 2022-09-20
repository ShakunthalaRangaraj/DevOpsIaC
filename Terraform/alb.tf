# Creating External LoadBalancer
resource "aws_lb" "external-alb" {
  name               = "ExternalLB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app_sg.id]
  subnets            = [aws_subnet.app_sub.id]
}
resource "aws_lb_target_group" "target-alb" {
  name     = "ALBTG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.terraform_vpc.id
}
resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = aws_lb_target_group.target-alb.arn
  target_id        = aws_instance.appserver.id
  port             = 80
depends_on = [
  aws_instance.appserver,
]
}
