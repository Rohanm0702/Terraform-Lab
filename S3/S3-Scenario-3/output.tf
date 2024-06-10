output "rohan_bucket_id" {
  description = "The ID of the created S3 bucket"
  value       = aws_s3_bucket.rohan_bucket.id
}

output "rohan_bucket_arn" {
  description = "The ARN of the created S3 bucket"
  value       = aws_s3_bucket.rohan_bucket.arn
}

output "rohan_bucket_region" {
  description = "The AWS region where the S3 bucket is created"
  value       = aws_s3_bucket.rohan_bucket.region
}