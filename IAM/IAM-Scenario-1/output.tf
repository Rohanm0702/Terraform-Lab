output "developer_group_name" {
  description = "The name of the developers IAM group."
  value       = aws_iam_group.developers.name
}

output "admin_group_name" {
  description = "The name of the admins IAM group."
  value       = aws_iam_group.admins.name
}

output "project_users_group_name" {
  description = "The name of the project users IAM group."
  value       = aws_iam_group.project_users.name
}

output "interns_group_name" {
  description = "The name of the interns IAM group."
  value       = aws_iam_group.interns.name
}

output "guests_group_name" {
  description = "The name of the guests IAM group."
  value       = aws_iam_group.guests.name
}

output "developer_policy_arn" {
  description = "The ARN of the developer policy."
  value       = aws_iam_policy.developer_policy.arn
}

output "admin_policy_arn" {
  description = "The ARN of the admin policy."
  value       = aws_iam_policy.admin_policy.arn
}

output "project_user_policy_arn" {
  description = "The ARN of the project user policy."
  value       = aws_iam_policy.project_user_policy.arn
}

output "intern_policy_arn" {
  description = "The ARN of the intern policy."
  value       = aws_iam_policy.intern_policy.arn
}

output "guest_policy_arn" {
  description = "The ARN of the guest policy."
  value       = aws_iam_policy.guest_policy.arn
}
