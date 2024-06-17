#--------auto_Scaling_Group-----------------------------

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template
# ----------Lauch Template --------
resource "aws_launch_template" "web_launch_template" {
  name                 = "web_lauch_template_v1"
  image_id             = "ami-09040d770ffe2224f"
  key_name             = "maker"
  instance_type        = "t2.micro"
  network_interfaces {
    security_groups = [ aws_security_group.elb_security_group.id ]
    subnet_id = module.vpc-module.private_subnet_1_id
    device_index = 0
    network_card_index = 0
  }
  network_interfaces {
    security_groups = [aws_security_group.elb_security_group.id]
    subnet_id = module.vpc-module.private_subnet_2_id
    device_index = 1
    network_card_index = 0
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Web-server"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group
#--------auto_Scaling_Group-----------------------------
resource "aws_autoscaling_group" "web_asg" {
  name             = "web-asg"
  max_size         = 3
  min_size         = 1
  desired_capacity = 2
  target_group_arns = [aws_alb_target_group.web_elb_target_group.arn]

  launch_template {
    id = aws_launch_template.web_launch_template.id
    version = "$Latest"

  }

}