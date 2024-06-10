lambda_function_name   = "ebs-snapshot-lambda"
lambda_role_name       = "lambda_ebs_snapshot_role"
cloudwatch_rule_name   = "schedule_lambda_trigger"
cron_schedule_expression = "cron(59 23 * * *)" 
