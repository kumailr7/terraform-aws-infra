// Create private subnets in all AZs
resource "aws_subnet" "private_subnet" {
  vpc_id            = var.vpc_id
  count             = length(var.availability_zones)
  cidr_block        = var.private_subnet_cidr_prefixes[count.index] # Adjust CIDR for each AZ
  availability_zone = var.availability_zones[count.index]
  tags = merge(
    var.tags, {Name = "${var.app}-${var.environment}-private-subnet"}
  )
}

resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id

  route {
    ## assocaited Subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    ## CRT uses this IGW to reach internet
    nat_gateway_id = var.igw_id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = var.igw_id
  }
  tags = merge(
    var.tags, {Name = "${var.app}-${var.environment}-private-rt"}
  )
}

# Associate public route table with public subnet
resource "aws_route_table_association" "subnet_private_route_table_association" {
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}


## Creating a Elastic IP
resource "aws_eip" "two" {
  depends_on                = [var.igw_id]
}

# Create a NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.two.allocation_id
  subnet_id     = aws_subnet.private_subnet[count.index].id
  depends_on = [ var.igw_id ]
  tags = merge(
    var.tags, {Name = "${var.app}-${var.environment}-nat-gateway"}
  )
}