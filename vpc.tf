terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_vpc" "TerraformVPC" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "TerraformVPC"
  }
}

resource "aws_subnet" "PublicSubnet" {
  vpc_id     = aws_vpc.TerraformVPC.id
  cidr_block = var.public_subnet_cidr

  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_subnet" "PrivateSubnet" {
  vpc_id     = aws_vpc.TerraformVPC.id
  cidr_block = var.private_subnet_cidr

  tags = {
    Name = "PrivateSubnet"
  }
}

resource "aws_internet_gateway" "TerraformInternetGateway" {
  vpc_id = aws_vpc.TerraformVPC.id

  tags = {
    Name = "TerraformInternetGateway"
  }
}

resource "aws_route_table" "PublicSubnetRouteTable" {
  vpc_id = aws_vpc.TerraformVPC.id

  route {
    cidr_block = var.public_subnet_route_cidr
    gateway_id = aws_internet_gateway.TerraformInternetGateway.id
  }

  tags = {
    Name = "PublicSubnetRouteTable"
  }
}

resource "aws_main_route_table_association" "PublicSubnetRouteTableAssociation" {
  vpc_id         = aws_vpc.TerraformVPC.id
  route_table_id = aws_route_table.PublicSubnetRouteTable.id
}

resource "aws_eip" "NAT-EIP" {
  domain="vpc"
}

resource "aws_nat_gateway" "NAT-Gateway" {
  allocation_id = aws_eip.NAT-EIP.id  
  subnet_id = aws_subnet.PublicSubnet.id
  tags = {
    Name = "NAT-Gateway"
  }
}

resource "aws_route_table" "PrivateSubnetRouteTable" {
  vpc_id = aws_vpc.TerraformVPC.id

  route {
    cidr_block = var.private_subnet_route_cidr
    nat_gateway_id = aws_nat_gateway.NAT-Gateway.id
  }

  tags = {
    Name = "PrivateSubnetRouteTable"
  }
}

resource "aws_main_route_table_association" "PrivateSubnetRouteTableAssociation" {
  vpc_id         = aws_vpc.TerraformVPC.id
  route_table_id = aws_route_table.PrivateSubnetRouteTable.id
}

resource "aws_security_group" "VPCSecurityGroup" {
  vpc_id = aws_vpc.TerraformVPC.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.ssh_cidr_block
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_block
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.http_cidr_block
  }

  tags = {
    Name = "VPCSecurityGroup"
  }
}
