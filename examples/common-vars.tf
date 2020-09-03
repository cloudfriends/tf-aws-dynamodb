variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "namespace" {
  type        = string
  default     = ""
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'rti' or 'dxip'"
}

variable "env" {
  type        = string
  default     = ""
  description = "Environment, e.g. 'prod', 'stage', 'dev', 'e2e', 'test'"
}

variable "business_domain" {
  type        = string
  default     = ""
  description = "Business Domain , e.g. 'inventory', 'parts'"
}