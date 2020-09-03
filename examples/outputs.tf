output "table-names" {
  value       = module.dynamodb_table.table-names
  description = "DynamoDB table name"
}

output "table-arns" {
  value       = module.dynamodb_table.table-arns
  description = "DynamoDB table arn"
}

output "table-info-list" {
  value = module.dynamodb_table.table-info-list
  description = "DynamoDB table mapping"
}