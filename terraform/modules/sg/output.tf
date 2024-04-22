output "alb_sg_id" {
  value = aws_security_group.alb_sg[*].id
}

output "web_sg_id" {
  value = aws_security_group.allow_web[*].id
}