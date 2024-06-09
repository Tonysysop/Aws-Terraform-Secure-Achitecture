# Terraform Module: Networking Setup

This Terraform module creates a networking setup in AWS, including a VPC with public and private subnets, internet gateway, NAT gateways, route tables, and necessary associations.

## Files

- **vpc.tf**: Defines the Virtual Private Cloud (VPC) along with its subnets.
- **internet_gateway.tf**: Creates an internet gateway and attaches it to the VPC.
- **nat_gateway.tf**: Sets up NAT gateways for outbound internet traffic from private subnets.
- **route_table.tf**: Configures route tables for public and private subnets.
- **output.tf**: Defines output variables for referencing resources created by the module.
- **variables.tf**: Specifies input variables required by the module.

## Usage

```hcl
module "networking" {
  source            = "organization/networking/aws"
  version           = "x.x.x"
  vpc_cidr          = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones   = ["us-west-1a", "us-west-1b"]
  igw_name            = "web_igw"
}
```

## Inputs

- **vpc_cidr**: CIDR range of the VPC.
- **public_subnet_cidrs**: List of CIDR blocks for public subnets.
- **private_subnet_cidrs**: List of CIDR blocks for private subnets.
- **availability_zones**: Availability zones for each subnet.
- **igw_name**: Name of the internet gateway.

## Outputs

- **public_subnet_1_id**: ID of the first public subnet.
- **public_subnet_2_id**: ID of the second public subnet.
- **private_subnet_1_id**: ID of the first private subnet.
- **private_subnet_2_id**: ID of the second private subnet.
- **vpc_id**: ID of the VPC.

## Authors

Maintainer: Anthony Osunde

## License

This module is licensed under Tonysysops.

## Support

For support, please [submit an issue](https://github.com/Tonysysop/Aws-Terraform-Secure-Achitecture/issues) or contact Mrtonero4@gmail.com.
