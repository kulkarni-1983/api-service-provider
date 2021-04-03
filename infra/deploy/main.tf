# create the cluster to host ecs service
module "api_service_ecs_cluster" {
  source          = "../modules/ecs-cluster"
  resource_prefix = local.resource_prefix
  tags            = local.tags
}

module "api_service_alb" {
  source          = "../modules/alb"
  resource_prefix = local.resource_prefix
  tags            = local.tags
  is_private_network = true

  private_subnet_ids = data.aws_subnet_ids.private.ids
  public_subnet_ids = data.aws_subnet_ids.public.ids
  vpc = data.aws_vpc.default_vpc
  
}

module "api_service_ecs_service" {
  source          = "../modules/ecs-service"
  resource_prefix = local.resource_prefix
  tags            = local.tags

  ecs_cluster_name = module.api_service_ecs_cluster.cluster_name

  container_name = "api-service-provider"
  container_port = 8080
  image_url = var.api_service_provider_image_url
  # possible values for fargate 256,512,1024....
  task_cpu = 256
  # possible values for fargate 512,1024,2048...
  task_memory = 512 

  vpc = data.aws_vpc.default_vpc
  private_subnet_ids = data.aws_subnet_ids.private.ids

  alb_listener_arn = module.api_service_alb.http_alb_listener_arn
}