# Creating vpc (Virtual Private Network)
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "vpc_web" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "Mrtonero-VPC"
  }
}

# creating vpc subnets (public subnet 1)
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "public_subnet_1" {
  vpc_id                                      = aws_vpc.vpc_web.id
  cidr_block                                  = var.public_subnet_cidrs[0]
  availability_zone                           = var.availability_zones[0]
  map_public_ip_on_launch                     = true
  enable_resource_name_dns_a_record_on_launch = true
  tags = {
    Name = "Public_subnet_1"
  }
}

# creating vpc subnets (public subnet 2)
resource "aws_subnet" "public_subnet_2" {
  vpc_id                                      = aws_vpc.vpc_web.id
  cidr_block                                  = var.public_subnet_cidrs[1]
  availability_zone                           = var.availability_zones[1]
  map_public_ip_on_launch                     = true
  enable_resource_name_dns_a_record_on_launch = true
  tags = {
    Name = "public_subnet_2"
  }
}

# creating the private subnet 1
resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.vpc_web.id
  cidr_block              = var.private_subnet_cidrs[0]
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = false
  tags = {
    Name = "private_subnet_1"
  }
}

# creating private subnet 2
resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.vpc_web.id
  cidr_block              = var.private_subnet_cidrs[1]
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = false
  tags = {
    Name = "Private_subnet_2"
  }

}

