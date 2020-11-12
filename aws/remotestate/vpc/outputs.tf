output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.vpc.public_subnets
}

output "igw_id" {
  value = module.vpc.igw_id
}

output "web_sec_id" {
  value = aws_security_group.web.id
}
