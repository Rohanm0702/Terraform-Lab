variable "region" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "us-west-2"
}

variable "role_name" {
  description = "The name of the IAM role to create."
  type        = string
}

variable "cross_account_id" {
  description = "The AWS account ID that can assume the role."
  type        = string
}

variable "policy_file_path" {
  description = "The path to the IAM policy JSON file."
  type        = string
  default     = "policy.json"
}
