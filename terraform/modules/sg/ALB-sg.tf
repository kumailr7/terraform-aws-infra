resource "aws_security_group" "alb_sg" {
  count   = length(var.alb_ingress_ports)
  vpc_id  = var.vpc_id
   name        = "allow_alb_traffic_${count.index}"
  dynamic "ingress" {
    for_each = var.alb_ingress_ports
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_block
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags, {Name = "${var.app}-${var.environment}-alb-sg"}
  )
}