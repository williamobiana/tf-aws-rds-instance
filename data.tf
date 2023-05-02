
locals {
  prefix                  = "${local.environment}-${var.client_id}"
  environment             = var.environment == null ? terraform.workspace : var.environment
  default_tags = {
    client        = var.client_id
    deployment_id = var.deployment_id
    environment   = local.environment
    owner         = var.owner
  }
}

data "aws_subnet" "subnet" {
  id = var.vpc_subnet_ids[0]
}
