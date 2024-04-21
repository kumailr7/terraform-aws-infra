// Create private subnets in all AZs
resource "aws_subnet" "private_subnet" {
  vpc_id            = var.vpc_id
  count             = length(var.availability_zones)
  map_public_ip_on_launch = var.private_ip    ## It mskes this a private Subnet 
  cidr_block        = var.private_subnet_cidr_prefixes[count.index] # Adjust CIDR for each AZ
  availability_zone = var.availability_zones[count.index]
  tags = merge(
    var.tags, {Name = "${var.app}-${var.environment}-private-subnet"}
  )
}