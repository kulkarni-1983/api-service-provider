output "alb_arn" {
  value = aws_lb.main.id
}

output "alb_dns_name" {
  value = aws_lb.main.dns_name
}

output "http_alb_listener_arn" {
  value = aws_lb_listener.http.id
}