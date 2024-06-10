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
variable "ec2_vpc"{
    description = "The CIDR block for the EC2 vpc"
    type        = string
}