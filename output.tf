output "private_subnet_1_id" {
  value = module.vpc-module.private_subnet_1_id
}

output "private_subnet_2_id" {
  value = module.vpc-module.private_subnet_2_id
}

output "public_subnet_1_id" {
  value = module.vpc-module.public_subnet_1_id
}

output "public_subnet_2_id" {
  value = module.vpc-module.public_subnet_2_id
}

output "private_webserver_1_ip" {
  value = aws_instance.web_server_1.private_ip
}

output "private_webserver_2_ip" {
  value = aws_instance.web_server_2.private_ip
}

output "Bastion_host_ip" {
  value = aws_instance.Bastion_Host.public_ip
}

output "vpc_id" {
  value = module.vpc-module.vpc_id
}