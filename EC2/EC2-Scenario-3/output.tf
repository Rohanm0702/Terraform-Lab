output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = aws_lambda_function.ebs_snapshot_lambda.arn
}

output "cloudwatch_rule_arn" {
  description = "ARN of the CloudWatch Events rule"
  value       = aws_cloudwatch_event_rule.lambda_trigger.arn
}
