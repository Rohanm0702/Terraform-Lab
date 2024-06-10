output "rds_instance_type" {
  description = "Instance type of the RDS instance"
  value       = aws_db_instance.lab-rds.instance_class
}

output "rds_engine" {
  description = "Database engine type of the RDS instance"
  value       = aws_db_instance.lab-rds.engine
}

output "rds_engine_version" {
  description = "Database engine version of the RDS instance"
  value       = aws_db_instance.lab-rds.engine_version
}

output "rds_allocated_storage" {
  description = "Allocated storage of the RDS instance (in GB)"
  value       = aws_db_instance.lab-rds.allocated_storage
}

output "rds_storage_type" {
  description = "Storage type of the RDS instance"
  value       = aws_db_instance.lab-rds.storage_type
}
