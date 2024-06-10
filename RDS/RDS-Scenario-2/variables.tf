variable "rds_identifier" {
    type=string
    description = "Identifier for the RDS instance"
}

variable "rds_instance_type" {
    type=string
    description = "Instance type for the RDS instance"
}

variable "rds_engine" {
    type=string
    description = "Database engine type (mysql)"
}

variable "rds_engine_version" {
    type=string
   description = "Database engine version"
}

variable "rds_allocated_storage" {
    type=string
    description = "Allocated storage for the RDS instance (in GB)"
}

variable "rds_storage_type" {
    type=string
    description = "Storage type for the RDS instance (e.g., gp2, io1)"
}

variable "rds_username" {
    type=string
    description = "Username for the RDS instance"
}

variable "rds_password" {
    type=string
    sensitive = true
    description = "Password for the RDS instance"
}

variable "rds_parameter_group" {
  description = "Parameter group name for the RDS instance"
}

variable "backup_retention_period" {
  description = "Backup retention period (in days)"
}

variable "maintenance_window" {
  description = "Preferred maintenance window for the RDS instance"
}

variable "vpc_cidr" {
    type=string
    description = "The vpc of the db"
}

variable "subnet_cidr-1" {
    type=string
    description = "The subnet-1 of the db"
}

variable "subnet_cidr-2" {
    type=string
    description = "The subnet-2 of the db"
}

variable "az1" {
    type=string
    description = "The availabilty zone of subnet-1"
}

variable "az2" {
    type=string
    description = "The availabilty zone of subnet-2"
}

variable "snapshot_identifier" {
    type = string
    description = "Identifier for the RDS snapshot"
}

variable "snapshot_name" {
    type = string
    description = "Name tag for the RDS snapshot"
}