rds_identifier          = "lab"
rds_instance_type       = "db.t3.micro"
rds_engine              = "mysql"
rds_engine_version      = "8.0.35"
rds_allocated_storage   = 10
rds_key                 = "arn:aws:kms:us-east-1:851725305422:key/0c2f63f7-edb2-44b6-a1c4-392bd53dc447"
rds_storage_type        = "gp2"
encryption              = true
rds_username            = "rohan"
rds_password            = "password123"
rds_parameter_group     = "default.mysql8.0"
vpc_cidr                = "10.0.0.0/16"
subnet_cidr-1           = "10.0.0.0/24"
subnet_cidr-2           = "10.0.1.0/24"
az1                     = "us-east-1a"
az2                     = "us-east-1b"