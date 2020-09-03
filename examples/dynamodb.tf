locals {
  dynamo_table_prefix = join("-" , [var.namespace, var.business_domain,""] )
  common_tags = jsondecode(file("templates/stack_tags.json"))
}

module "dynamodb_table" {
  source       = "../"
  aws_region   = var.aws_region
  table_prefix = local.dynamo_table_prefix
  table_def = jsondecode(templatefile("templates/dynamo_table_def.json.tpl", {
    dynamo_enable_replica = var.dynamo_enable_replica
  }))
  tags = merge(local.common_tags, {"extra" = "cookie"} )
}
