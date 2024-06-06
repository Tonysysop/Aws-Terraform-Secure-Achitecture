# Route Table for subnets

# Public subnets route table

resource "aws_route_table" "public_subnets_route_table" {
  vpc_id = aws_vpc.vpc_web.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web_igw.id
  }

  tags = {
    Name = "Public_subnet_rt"
  }
}

# associating to public subnet 1
resource "aws_route_table_association" "public_subnet_1_rt_Association" {
  subnet_id = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_subnets_route_table.id
}


# Assoicate rt to public subnets 2
resource "aws_route_table_association" "public_subnet_2_rt_Association" {
  subnet_id = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_subnets_route_table.id
}

# Private subnet_1 Route
resource "aws_route_table" "private_subnet_1_rt" {
  vpc_id = aws_vpc.vpc_web.id

  tags = {
    Name = "private_subnet_1_rt"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route#core_network_arn
resource "aws_route" "private_subnet_1_Route" {
  route_table_id = aws_route_table.private_subnet_1_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.web_natgway_1.id
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "private_subnet_1_rt_association" {
  subnet_id = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_subnet_1_rt.id
}


# Private subnet_2 Route
resource "aws_route_table" "private_subnet_2_rt" {
  vpc_id = aws_vpc.vpc_web.id

  tags = {
    Name = "private_subnet_2_rt"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route#core_network_arn
resource "aws_route" "private_subnet_2_Route" {
  route_table_id = aws_route_table.private_subnet_2_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.web_natgway_2.id
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "private_subnet_2_rt_association" {
  subnet_id = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_subnet_2_rt.id

}

