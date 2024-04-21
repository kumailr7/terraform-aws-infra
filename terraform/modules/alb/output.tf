output "aws_alb_target_group_arn" {
  value = aws_lb_target_group.public_target_group.arn
}

output "alb_dnsname" {
 value = aws_lb.alb.dns_name
}

output "aws_lb_listener" {
  value = aws_lb_listener.listener.arn
}

output "alb_arn" {
  value = aws_lb.alb.arn
}