variable "iam_users" {
  description = "List of IAM user names."
  type        = list(string)
}

variable "developer_users" {
  description = "List of developer IAM user names."
  type        = list(string)
}

variable "admin_users" {
  description = "List of admin IAM user names."
  type        = list(string)
}

variable "project_users" {
  description = "List of project IAM user names."
  type        = list(string)
}

variable "intern_users" {
  description = "List of intern IAM user names."
  type        = list(string)
}

variable "guest_users" {
  description = "List of guest IAM user names."
  type        = list(string)
}
