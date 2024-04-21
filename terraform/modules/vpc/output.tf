output "vpc_id" {
  value = aws_vpc.vpc.id
}

## The CIDR block of the VPC
output "vpc_cidr_block" {
    value = aws_vpc.vpc.cidr_block  
}