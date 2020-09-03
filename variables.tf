variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "table_prefix" {
  type        = string
  description = "Table Prefix"
}

variable "table_def" {
  type        = any
  description = "DynamoDB Table Definition"
}

variable "billing_mode" {
  type        = string
  default     = "PAY_PER_REQUEST"
  description = "DynamoDB Billing mode. Can be PROVISIONED or PAY_PER_REQUEST"
}

variable "dynamo_enable_replica" {
  type        = bool
  default     = true
  description = "Enable /Disable DynamoDB Replica Tables"
}

variable "dynamo_replica_region" {
  type        = string
  default     = ""
  description = "Region for DynamoDB Replica Tables"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Common tags (e.g. `map('BusinessUnit','XYZ')`"
}