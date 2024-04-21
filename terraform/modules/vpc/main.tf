resource "aws_vpc" "vpc" {
  cidr_block = var.cidr
  enable_dns_support = var.enable_dns_support   ## gives you an internal domain name    Default set true
  enable_dns_hostnames = var.enable_dns_hostnames  ## gives you an internal host name     Default set true
  instance_tenancy = var.instance_tenancy
  tags = merge(
    var.tags, {Name = "${var.app}-${var.environment}-vpc"}
  )
}

## Default Security Group of VPC restrcits all traffics
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.vpc.id

  ingress {
    protocol = -1
    self = true
    from_port = 0
    to_port = 0
  }

  egress {
    from_port = 0 
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = merge(
    var.tags, {Name = "${var.app}-${var.environment}-default-vpc-sg"}
  )
}
