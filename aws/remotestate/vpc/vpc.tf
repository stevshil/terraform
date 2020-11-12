module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.projectname}-vpc"
  cidr = var.vpc_cidr

  azs            = ["${var.region}a", "${var.region}b"]
  public_subnets = var.pubsubs

  enable_nat_gateway   = false
  enable_vpn_gateway   = false
  create_igw           = true
  enable_dns_hostnames = true

  tags = merge(var.tags, { Name = "${var.projectname} ${var.env} VPC Demo" })
}
