resource "aws_instance" "private_instances" {
  count           = 2
  ami             = var.ami_id
  instance_type   = "t2.micro"
  subnet_id       = var.private_subnet_ids
  security_groups = var.web_sg_id
  tags = merge(
    var.tags, {Name = "${var.app}-${var.environment}-private-instances"}
  )
}

resource "aws_instance" "public_instance" {
  ami             = var.ami_id
  instance_type   = "t2.micro"
  subnet_id       = var.public_subnet_ids
  security_groups = var.web_sg_id
  tags = merge(
    var.tags, {Name = "${var.app}-${var.environment}-public-instances"}
  )
}