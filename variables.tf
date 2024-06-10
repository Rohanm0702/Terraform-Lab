variable "lambda_execution_role_name" {
  description = "Name of the IAM role for Lambda execution."
  type        = string
  default     = "LambdaExecutionRole"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function."
  type        = string
  default     = "RotateAccessKeysFunction"
}

variable "cloudwatch_event_rule_name" {
  description = "Name of the CloudWatch Events rule."
  type        = string
  default     = "RotateAccessKeysRule"
}

variable "lambda_execution_policy_name" {
  description = "Name of the IAM policy for Lambda execution."
  type        = string
  default     = "LambdaExecutionPolicy"
}
