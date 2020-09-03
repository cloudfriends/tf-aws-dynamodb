output "table-names" {
  value       = values(aws_dynamodb_table.all)[*]["id"]
  description = "DynamoDB table name"
}

output "table-arns" {
  value       = values(aws_dynamodb_table.all)[*]["arn"]
  description = "DynamoDB table arn"
}

output "table-info-list" {
  value = [
    for instance in aws_dynamodb_table.all:
    map("table_name"  ,  instance.id , 
        "table_arn"   ,  instance.arn , 
        "stream_arn"  ,  instance.stream_arn
        )
  ]
  description = "DynamoDB table mapping"
}