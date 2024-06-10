variable "ec2_ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) to use for EC2 instances."
  type        = string
}

variable "ec2_instance_type" {
  description = "The type of EC2 instance to launch."
  type        = string
}

variable "ec2_subnet_cidr" {
  description = "The CIDR block for the EC2 subnet."
  type        = string
}

variable "ec2_ebs_volume_size" {
  description = "The size of the EBS volume in GB."
  type        = number
}

variable "ec2_launch_template_block_device" {
  description = "Configuration for the block device mapping in the EC2 launch template."
  type        = map(any)
}

variable "ec2_autoscaling_group_name" {
  description = "The name of the Auto Scaling Group for EC2 instances."
  type        = string
}

variable "ec2_autoscaling_max_size" {
  description = "The maximum number of instances in the Auto Scaling Group."
  type        = number
}

variable "ec2_autoscaling_min_size" {
  description = "The minimum number of instances in the Auto Scaling Group."
  type        = number
}

variable "ec2_autoscaling_desired_capacity" {
  description = "The desired capacity for the Auto Scaling Group."
  type        = number
}

variable "ec2_autoscaling_health_check_grace_period" {
  description = "The grace period for health checks in seconds."
  type        = number
}

variable "ec2_autoscaling_health_check_type" {
  description = "The type of health check used by the Auto Scaling Group."
  type        = string
}

variable "ec2_autoscaling_force_delete" {
  description = "Whether to force deletion of instances when scaling down."
  type        = bool
}

variable "ec2_autoscaling_min_healthy_percentage" {
  description = "The minimum healthy percentage for instance maintenance."
  type        = number
}

variable "ec2_autoscaling_max_healthy_percentage" {
  description = "The maximum healthy percentage for instance maintenance."
  type        = number
}

variable "ec2_autoscaling_timeout_delete" {
  description = "Timeout for deletion of the Auto Scaling Group in minutes."
  type        = string
}
