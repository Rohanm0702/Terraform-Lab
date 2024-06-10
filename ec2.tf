terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
resource "aws_instance" "labec2" {
  ami               = var.ec2_ami_id
  instance_type     = var.ec2_instance_type
  subnet_id         = aws_subnet.ec2_subnet.id
  availability_zone = "us-east-1a"
  tags = {
    Name = "LabEC2"
  }
}
resource "aws_vpc" "ec2_vpc" {
  cidr_block       = var.ec2_vpc
  instance_tenancy = "default"

  tags = {
    Name = "ec2_vpc"
  }
}

resource "aws_subnet" "ec2_subnet" {
  vpc_id     = aws_vpc.ec2_vpc.id
  cidr_block = var.ec2_subnet_cidr
  availability_zone = "us-east-1a"
  tags = {
    Name = "ec2_subnet"
  }
}