terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_db_instance" "lab-rds" {
  identifier            = var.rds_identifier
  instance_class        = var.rds_instance_type
  engine                = var.rds_engine
  engine_version        = var.rds_engine_version
  allocated_storage     = var.rds_allocated_storage
  kms_key_id            = var.rds_key
  storage_type          = var.rds_storage_type
  storage_encrypted     = var.encryption
  username              = var.rds_username
  password              = var.rds_password
  parameter_group_name  = var.rds_parameter_group
  db_subnet_group_name = aws_db_subnet_group.subnet_group.name
  depends_on = [aws_db_subnet_group.subnet_group]
}

resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "vpc"
  }
}
resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr-1
  availability_zone = var.az1
  tags = {
    Name = "subnet-1"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr-2
  availability_zone = var.az2
  tags = {
    Name = "subnet-2"
  }
}

resource "aws_db_subnet_group" "subnet_group" {
  name       = "subnetgroup"
  subnet_ids = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]

  tags = {
    Name = "RDS subnet group"
  }
}