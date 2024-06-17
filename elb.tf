# Elastic Load Balancer
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb
resource "aws_lb" "web_elb" {
  name               = "web-elb-tf"
  internal           = false
  load_balancer_type = "application"

  subnets = [
    module.vpc-module.public_subnet_1_id,
    module.vpc-module.public_subnet_2_id
  ]
  security_groups = [aws_security_group.elb_security_group.id]

}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group
#------alb Target groups----------------
resource "aws_alb_target_group" "web_elb_target_group" {
  name        = "web-elb-target-group"
  target_type = "instance"
  port        = 8000
  protocol    = "HTTP"
  vpc_id      = module.vpc-module.vpc_id

  health_check {
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 5
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule
#--------aws_lb_listener -------
resource "aws_lb_listener" "web_elb_lb_listener" {
  load_balancer_arn = aws_lb.web_elb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.web_elb_target_group.arn
    type             = "forward"
  }
}















