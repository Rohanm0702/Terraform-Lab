output "lambda_function_name" {
  description = "Name of the Lambda function."
  value       = aws_lambda_function.rotate_access_keys.function_name
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function."
  value       = aws_lambda_function.rotate_access_keys.arn
}

output "cloudwatch_rule_name" {
  description = "Name of the CloudWatch Events rule."
  value       = aws_cloudwatch_event_rule.rotate_access_keys_rule.name
}

output "lambda_execution_role_name" {
  description = "Name of the IAM role for Lambda execution."
  value       = aws_iam_role.lambda_execution_role.name
}
