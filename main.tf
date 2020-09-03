resource "aws_dynamodb_table" "all" {

  for_each = var.table_def

  name             = "${var.table_prefix}${each.key}"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
  billing_mode     = var.billing_mode
  hash_key         = each.value.hash_key
  range_key        = lookup(each.value, "range_key" ,"")
  tags             = var.tags

  dynamic "attribute" {
    for_each = each.value.attributes
    content {
      name = attribute.key
      type = attribute.value
    }
  }

  dynamic "local_secondary_index" {
    for_each = each.value.local_secondary_indices
    content {
      name               = local_secondary_index.key
      range_key          = local_secondary_index.value.range_key
      projection_type    = local_secondary_index.value.projection_type
      non_key_attributes = local_secondary_index.value.non_key_attributes
    }
  }

  dynamic "global_secondary_index" {
    for_each = each.value.global_secondary_indices
    content {
      name               = global_secondary_index.key
      write_capacity     = global_secondary_index.value.write_capacity
      read_capacity      = global_secondary_index.value.read_capacity
      hash_key           = global_secondary_index.value.hash_key
      range_key          = global_secondary_index.value.range_key
      projection_type    = global_secondary_index.value.projection_type
      non_key_attributes = global_secondary_index.value.non_key_attributes
    }
  }

  replica {
    region_name = each.value.dynamo_enable_replica ? var.dynamo_replica_region : ""
  }

  ttl {
    attribute_name = lookup(each.value, "ttl_attribute" ,"")
    enabled        = can(each.value.ttl_attribute)
  }

  server_side_encryption {
    enabled = true
  }

  point_in_time_recovery {
    enabled = true
  }
}
