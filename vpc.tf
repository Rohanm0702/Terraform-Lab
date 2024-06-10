terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_vpc" "FirstVPC" {
  cidr_block       = var.FirstVPC_cidr
  instance_tenancy = "default"

  tags = {
    Name = "FirstVPC"
  }
}

resource "aws_subnet" "FirstSubnet" {
  vpc_id     = aws_vpc.FirstVPC.id
  cidr_block = var.FirstSubnet_cidr

  tags = {
    Name = "FirstSubnet"
  }
}

resource "aws_internet_gateway" "FirstVPCInternetGateway" {
  vpc_id = aws_vpc.FirstVPC.id

  tags = {
    Name = "FirstVPCInternetGateway"
  }
}

resource "aws_route_table" "FirstSubnetRouteTable" {
  vpc_id = aws_vpc.FirstVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.FirstVPCInternetGateway.id
  }

  tags = {
    Name = "FirstSubnetRouteTable"
  }
}

resource "aws_main_route_table_association" "FirstSubnetRouteTableAssociation" {
  vpc_id         = aws_vpc.FirstVPC.id
  route_table_id = aws_route_table.FirstSubnetRouteTable.id
}

resource "aws_security_group" "FirstVPCSecurityGroup" {
  vpc_id = aws_vpc.FirstVPC.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
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
    Name = "FirstVPCSecurityGroup"
  }
}

resource "aws_vpc" "SecondVPC" {
  provider        = aws.second_vpc
  cidr_block      = var.SecondVPC_cidr
  instance_tenancy = "default"

  tags = {
    Name = "SecondVPC"
  }
}

resource "aws_subnet" "SecondSubnet" {
  provider        = aws.second_vpc
  vpc_id          = aws_vpc.SecondVPC.id
  cidr_block      = var.SecondSubnet_cidr

  tags = {
    Name = "SecondSubnet"
  }
}

resource "aws_internet_gateway" "SecondVPCInternetGateway" {
  provider        = aws.second_vpc
  vpc_id          = aws_vpc.SecondVPC.id

  tags = {
    Name = "SecondVPCInternetGateway"
  }
}

resource "aws_route_table" "SecondSubnetRouteTable" {
  provider        = aws.second_vpc
  vpc_id          = aws_vpc.SecondVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.SecondVPCInternetGateway.id
  }

  tags = {
    Name = "SecondSubnetRouteTable"
  }
}

resource "aws_main_route_table_association" "SecondSubnetRouteTableAssociation" {
  provider        = aws.second_vpc
  vpc_id          = aws_vpc.SecondVPC.id
  route_table_id  = aws_route_table.SecondSubnetRouteTable.id
}

resource "aws_security_group" "SecondVPCSecurityGroup" {
  provider        = aws.second_vpc
  vpc_id          = aws_vpc.SecondVPC.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
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
    Name = "SecondVPCSecurityGroup"
  }
}

resource "aws_vpc_peering_connection" "first_to_second" {
  vpc_id          = aws_vpc.FirstVPC.id
  peer_vpc_id     = aws_vpc.SecondVPC.id

  tags = {
    Name = "FirstVPC-to-SecondVPC"
  }
}

resource "aws_vpc_peering_connection_accepter" "second_to_first" {
  provider                    = aws.second_vpc
  vpc_peering_connection_id   = aws_vpc_peering_connection.first_to_second.id

  auto_accept = true

  tags = {
    Name = "SecondToFirstVPCPeeringAccepter"
  }

  depends_on = [aws_vpc.SecondVPC]
}


resource "aws_route" "route_to_second_vpc" {
  route_table_id            = aws_route_table.FirstSubnetRouteTable.id
  destination_cidr_block    = var.SecondVPC_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.first_to_second.id

  depends_on = [aws_vpc_peering_connection.first_to_second]
}

resource "aws_route" "route_to_first_vpc" {
  provider                  = aws.second_vpc
  route_table_id            = aws_route_table.SecondSubnetRouteTable.id
  destination_cidr_block    = var.FirstVPC_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.second_to_first.id

  depends_on = [aws_vpc_peering_connection_accepter.second_to_first]
}