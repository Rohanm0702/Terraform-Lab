output "replication_rule_id" {
  description = "ID of the replication rule"
  value       = aws_s3_bucket_replication_configuration.replication.rule.0.id
}

output "replication_status" {
  description = "Status of the replication rule"
  value       = aws_s3_bucket_replication_configuration.replication.rule.0.status
}
