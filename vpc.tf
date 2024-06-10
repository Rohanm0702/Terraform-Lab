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

resource "aws_network_acl" "PublicSubnetACL" {
  vpc_id = aws_vpc.TerraformVPC.id

  egress {
    protocol   = var.public_egress_rule.protocol
    rule_no    = var.public_egress_rule.rule_no
    action     = var.public_egress_rule.action
    cidr_block = var.public_egress_rule.cidr_block
    from_port  = var.public_egress_rule.from_port
    to_port    = var.public_egress_rule.to_port
  }

  ingress {
    protocol   = var.public_ingress_rule.protocol
    rule_no    = var.public_ingress_rule.rule_no
    action     = var.public_ingress_rule.action
    cidr_block = var.public_ingress_rule.cidr_block
    from_port  = var.public_ingress_rule.from_port
    to_port    = var.public_ingress_rule.to_port
  }

  tags = {
    Name = "PublicSubnetACL"
  }
}

resource "aws_network_acl" "PrivateSubnetACL" {
  vpc_id = aws_vpc.TerraformVPC.id

  egress {
    protocol   = var.private_egress_rule.protocol
    rule_no    = var.private_egress_rule.rule_no
    action     = var.private_egress_rule.action
    cidr_block = var.private_egress_rule.cidr_block
    from_port  = var.private_egress_rule.from_port
    to_port    = var.private_egress_rule.to_port
  }

  ingress {
    protocol   = var.private_ingress_rule.protocol
    rule_no    = var.private_ingress_rule.rule_no
    action     = var.private_ingress_rule.action
    cidr_block = var.private_ingress_rule.cidr_block
    from_port  = var.private_ingress_rule.from_port
    to_port    = var.private_ingress_rule.to_port
  }

  tags = {
    Name = "PrivateSubnetACL"
  }
}

