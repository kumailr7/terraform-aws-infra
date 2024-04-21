resource "aws_lb" "alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.alb_sg_id
  subnets            = var.public_subnet_ids
  tags = merge(
    var.tags, {Name = "${var.app}-${var.environment}-alb"}
  )
}

resource "aws_lb_target_group" "public_target_group" {
  count = 3

  name     = "public-target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 10
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
  tags = merge(
    var.tags, {Name = "${var.app}-${var.environment}-alb-public-target-group"}
  )
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  dynamic "default_action" {
    for_each = aws_lb_target_group.public_target_group[*]
    content {
      type             = "forward"
      target_group_arn = default_action.value.arn
    }
  }
}

### PATH :- /DEV
resource "aws_lb_listener_rule" "dev_rule" {
  listener_arn = aws_lb_listener.listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public_target_group[0].arn
  }

  condition {
    path_pattern {
      values = ["/dev/*"]
    }
  }
  depends_on = [ aws_lb_target_group.public_target_group ]
}

## PATH: /STAGE
resource "aws_lb_listener_rule" "stage_rule" {
  listener_arn = aws_lb_listener.listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public_target_group[1].arn
  }

  condition {
    path_pattern {
      values = ["/stage/*"]
    }
  }
   depends_on = [ aws_lb_target_group.public_target_group ]
}

### PATH: /PROD
resource "aws_lb_listener_rule" "prod_rule" {
  listener_arn = aws_lb_listener.listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public_target_group[2].arn
  }

  condition {
    path_pattern {
      values = ["/prod/*"]
    }
  }
   depends_on = [ aws_lb_target_group.public_target_group ]
}