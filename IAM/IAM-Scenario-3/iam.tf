terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_iam_role" "lambda_execution_role" {
  name               = var.lambda_execution_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_execution_policy_attachment" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "rotate_access_keys" {
  function_name    = var.lambda_function_name
  filename         = "${path.module}/lambda_function.zip" 
  source_code_hash = filebase64sha256("${path.module}/lambda_function.zip")
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.8"
  role             = aws_iam_role.lambda_execution_role.arn

}

resource "aws_cloudwatch_event_rule" "rotate_access_keys_rule" {
  name                = var.cloudwatch_event_rule_name
  schedule_expression = "rate(1 day)"  
}

resource "aws_cloudwatch_event_target" "rotate_access_keys_target" {
  rule      = aws_cloudwatch_event_rule.rotate_access_keys_rule.name
  target_id = "RotateAccessKeysTarget"
  arn       = aws_lambda_function.rotate_access_keys.arn
}
