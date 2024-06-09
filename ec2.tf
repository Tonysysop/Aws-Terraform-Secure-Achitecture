
# Ec2 Instance to text VPC Module

resource "aws_instance" "web_server_1" {
  ami               = "ami-09040d770ffe2224f"
  instance_type     = "t2.micro"
  key_name          = "maker"
  subnet_id         = module.vpc-module.private_subnet_1_id
  availability_zone = var.availability_zones[0]
  security_groups   = [aws_security_group.allow_ssh_access.id]
  tags = {
    Name = "Webserver_private_subnet_1"
  }

}

# Private Webserver 2
resource "aws_instance" "web_server_2" {
  ami               = "ami-09040d770ffe2224f"
  instance_type     = "t2.micro"
  key_name          = "maker"
  subnet_id         = module.vpc-module.private_subnet_2_id
  availability_zone = var.availability_zones[1]
  security_groups   = [aws_security_group.allow_ssh_access.id]
  tags = {
    Name = "Webserver_private_subnet_2"
  }

}

## Bastion Host or Jump box  Server
resource "aws_instance" "Bastion_Host" {
  ami               = "ami-09040d770ffe2224f"
  instance_type     = "t2.micro"
  key_name          = "maker"
  subnet_id         = module.vpc-module.public_subnet_1_id
  availability_zone = var.availability_zones[0]
  security_groups   = [aws_security_group.allow_ssh_access.id]
  tags = {
    Name = "Bastion-Host"
  }
}