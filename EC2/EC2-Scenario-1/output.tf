output "ec2_instance_id" {
  description = "The ID of the launched EC2 instance"
  value       = aws_instance.labec2.id
}

output "ec2_autoscaling_group_name" {
  description = "The name of the Auto Scaling Group for EC2 instances"
  value       = aws_autoscaling_group.ec2_scaling.name
}

output "ec2_subnet_cidr" {
  description = "The CIDR block for the EC2 subnet"
  value       = aws_subnet.ec2_subnet.cidr_block
}

output "ec2_ebs_volume_id" {
  description = "The ID of the attached EBS volume"
  value       = aws_ebs_volume.labec2_ebs.id
}

output "ec2_launch_template_id" {
  description = "The ID of the EC2 launch template"
  value       = aws_launch_template.ec2_template.id
}

output "ec2_launch_template_block_device" {
  description = "The configuration for the block device mapping in the EC2 launch template"
  value       = aws_launch_template.ec2_template.block_device_mappings[0]
}
