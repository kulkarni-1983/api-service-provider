variable "aws_region" {
  description = "AWS region of deployment"
  default     = "ap-southeast-2"
}
variable "api_service_provider_image_url" {
  description = "Artifact host and path for the api-service-provider docker image"
}