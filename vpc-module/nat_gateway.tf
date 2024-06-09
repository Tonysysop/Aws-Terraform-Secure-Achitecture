# Create EIP (Elastic IP Address for the natgateway)
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
resource "aws_eip" "web_eip_1" {
  domain = "vpc"
  tags = {
    Name = "web_eip_1"
  }
}

resource "aws_eip" "web_eip_2" {
  domain = "vpc"
  tags = {
    Name = "web_eip_2"
  }
}

# NatGateway Resource 
resource "aws_nat_gateway" "web_natgway_1" {
  subnet_id     = aws_subnet.public_subnet_1.id
  allocation_id = aws_eip.web_eip_1.id

  tags = {
    Name = "web_natgway_1"
  }

  depends_on = [aws_internet_gateway.web_igw]
}

resource "aws_nat_gateway" "web_natgway_2" {
  subnet_id     = aws_subnet.public_subnet_2.id
  allocation_id = aws_eip.web_eip_2.id

  tags = {
    Name = "web_natgway_2"
  }

  depends_on = [aws_internet_gateway.web_igw]
}