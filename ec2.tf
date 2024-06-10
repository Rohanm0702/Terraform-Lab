terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_lambda_function" "ebs_snapshot_lambda" {
  filename         = "lambda_function.zip"
  function_name    = "ebs-snapshot-lambda"
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.8"

  source_code_hash = filebase64sha256("./lambda_function.zip")
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_ebs_snapshot_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_permissions" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_cloudwatch_event_rule" "lambda_trigger" {
  name                = "schedule_lambda_trigger"
  description         = "Trigger Lambda to take EBS snapshots"
  schedule_expression = "cron(0 0 * * ? *)"  

  tags = {
    Environment = "Production"
  }
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.lambda_trigger.name
  target_id = "lambda_target"
  arn       = aws_lambda_function.ebs_snapshot_lambda.arn
}

# Permission for CloudWatch Events to invoke Lambda function
resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ebs_snapshot_lambda.function_name
  principal     = "events.amazonaws.com"

  source_arn = aws_cloudwatch_event_rule.lambda_trigger.arn
}