output "alb_dns_name" {
  value       = module.api_service_alb.alb_dns_name
  description = "DNS name of ALB hosting api-service-provider"
}