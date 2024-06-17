# ------ELB Seurity group --------------------

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "elb_security_group" {
  name        = "elb_security_group"
  description = "Allow Web traffic to elb"
  vpc_id      = module.vpc-module.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}


# Instance security group
resource "aws_security_group" "allow_ssh_access" {
  name        = "Allow_ssh_access"
  description = "Allow SSH access on all instances and http access"
  vpc_id      = module.vpc-module.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # allow ssh from anywhere
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ## Open port 80
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.elb_security_group.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}









# security_group ingress rule
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule
# resource "aws_security_group_rule" "ssh_access_rule" {
#   security_group_id = aws_security_group.allow_ssh_access.id
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"] # allow ssh from anywhere
# }

# # Egress rule

# resource "aws_security_group_rule" "allow_all_outbound" {
#   security_group_id = aws_security_group.allow_ssh_access.id
#   type              = "egress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1" # Allow all traffic
#   cidr_blocks       = ["0.0.0.0/0"]

#}


## instance SG rule
