locals {
  tags = {
    Product     = "IOS+"
    Application = "Trading Service"
    Owner       = "Trading"
    Environment = "technet"
    Region      = var.aws_region
  }
  resource_prefix = "api-service"
}
