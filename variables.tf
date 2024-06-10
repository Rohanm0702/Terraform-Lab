variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_role_name" {
  description = "Name of the IAM role for Lambda"
  type        = string
}

variable "cloudwatch_rule_name" {
  description = "Name of the CloudWatch Events rule"
  type        = string
}

variable "cron_schedule_expression" {
  description = "Schedule expression for CloudWatch Events rule"
  type        = string 
}
