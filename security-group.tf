# security group to enable ssh access on all instances

resource "aws_security_group" "allow_ssh_access" {
  name        = "Allow_ssh_access"
  description = "Allow SSH access on all instances"
  vpc_id      = module.vpc-module.vpc_id
}

# security_group ingress rule
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule
resource "aws_security_group_rule" "ssh_access_rule" {
  security_group_id = aws_security_group.allow_ssh_access.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] # allow ssh from anywhere
}

# Egress rule

resource "aws_security_group_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.allow_ssh_access.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # Allow all traffic
  cidr_blocks       = ["0.0.0.0/0"]

}