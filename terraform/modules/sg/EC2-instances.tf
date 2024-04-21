#### This SG is used for 2 private and 1 public Instances
resource "aws_security_group" "allow_web" {
  count       = length(var.instance_ingress_ports)
  name        = "allow_web_traffic_${count.index}"
  description = "Allow Web inbound traffic"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.instance_ingress_ports[count.index]
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = merge(
    var.tags, {Name = "${var.app}-${var.environment}-ec2-instances-sg"}
  )
}
