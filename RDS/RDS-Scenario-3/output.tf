output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.lab-rds.endpoint
}

output "rds_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.lab-rds.arn
}

output "rds_instance_identifier" {
  description = "The identifier of the RDS instance"
  value       = aws_db_instance.lab-rds.identifier
}

output "rds_instance_class" {
  description = "The instance class of the RDS instance"
  value       = aws_db_instance.lab-rds.instance_class
}

output "rds_db_name" {
  description = "The name of the RDS instance"
  value       = aws_db_instance.lab-rds.name
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}

output "subnet_1_id" {
  description = "The ID of the first subnet"
  value       = aws_subnet.subnet_1.id
}

output "subnet_2_id" {
  description = "The ID of the second subnet"
  value       = aws_subnet.subnet_2.id
}

output "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  value       = aws_db_subnet_group.subnet_group.name
}
