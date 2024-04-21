output "alb_sg_id" {
  value = aws_security_group.alb_sg[count.index].id
}

output "web_sg_id" {
  value = aws_security_group.allow_web[count.index].id
}