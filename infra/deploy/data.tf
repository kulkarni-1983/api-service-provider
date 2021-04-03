data "aws_vpcs" "vpc_id" {
  tags = {
    Default = "true"
  }
}

data "aws_vpc" "default_vpc" {
  id = tolist(data.aws_vpcs.vpc_id.ids)[0]
}

data "aws_subnet_ids" "public" {
  vpc_id = tolist(data.aws_vpcs.vpc_id.ids)[0]

  tags = {
    Tier = "public"
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = tolist(data.aws_vpcs.vpc_id.ids)[0]

  tags = {
    Tier = "private"
  }
}
