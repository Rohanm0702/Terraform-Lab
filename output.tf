output "application_files_bucket_name" {
  description = "Name of the application files S3 bucket"
  value       = aws_s3_bucket.application_files.bucket
}

output "application_files_bucket_arn" {
  description = "ARN of the application files S3 bucket"
  value       = aws_s3_bucket.application_files.arn
}

output "static_assets_bucket_name" {
  description = "Name of the static assets S3 bucket"
  value       = aws_s3_bucket.static_assets.bucket
}

output "static_assets_bucket_arn" {
  description = "ARN of the static assets S3 bucket"
  value       = aws_s3_bucket.static_assets.arn
}
