# Creating internet agteway and its atachment
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
resource "aws_internet_gateway" "web_igw" {
  vpc_id = aws_vpc.vpc_web.id
  tags = {
    Name = var.igw_name
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway_attachment
#resource "aws_internet_gateway_attachment" "web_igws_attachment" {
  #internet_gateway_id = aws_internet_gateway.web_igw.id
  #vpc_id              = aws_vpc.vpc_web.id
#}
