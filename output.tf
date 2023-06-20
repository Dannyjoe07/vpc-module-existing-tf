output "id" {
  value       = data.aws_vpc.selected.id
  description = "VPC identifier"
}

output "vpc_cidr" {
  value       = data.aws_vpc.selected.cidr_block
  description = "VPC CIDR block"
}

output "public_subnets_ids" {
  value       = local.public_subnets_ids
  description = "Subnets identifier for public side"
}

output "public_subnet_id_az1" {
  value       = element(local.public_subnets_ids,0)
  description = "Subnets identifier for public side"
}

output "public_subnet_id_az2" {
  value       = element(local.public_subnets_ids,1)
  description = "Subnets identifier for public side"
}


# output "default_security_group" {
#   value       = data.aws_default_security_group.default.id
#   description = "Default security group of the VPC"
# }
