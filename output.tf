output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.TerraformVPC.id
}

output "public_subnet_id" {
  description = "public subnet ID"
  value       = aws_subnet.PublicSubnet.id
}

output "private_subnet_id" {
  description = "Tprivate subnet ID"
  value       = aws_subnet.PrivateSubnet.id
}

output "public_route_table_id" {
  description = "public subnet route table ID"
  value       = aws_route_table.PublicSubnetRouteTable.id
}

output "private_route_table_id" {
  description = "private subnet route table ID"
  value       = aws_route_table.PrivateSubnetRouteTable.id
}

output "public_route_table_association_id" {
  description = "The ID of the main route table association for the public subnet"
  value       = aws_main_route_table_association.PublicSubnetRouteTableAssociation.id
}

output "private_route_table_association_id" {
  description = "The ID of the main route table association for the private subnet"
  value       = aws_main_route_table_association.PrivateSubnetRouteTableAssociation.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.TerraformVPC.cidr_block
}

output "public_subnet_cidr_block" {
  description = "The CIDR block of the public subnet"
  value       = aws_subnet.PublicSubnet.cidr_block
}

output "private_subnet_cidr_block" {
  description = "The CIDR block of the private subnet"
  value       = aws_subnet.PrivateSubnet.cidr_block
}

output "public_subnet_acl_id" {
  description = "ID of the Public Subnet Network ACL"
  value       = aws_network_acl.PublicSubnetACL.id
}

output "public_subnet_acl_vpc_id" {
  description = "VPC ID of the Public Subnet Network ACL"
  value       = aws_network_acl.PublicSubnetACL.vpc_id
}

output "public_subnet_acl_egress_rules" {
  description = "Egress rules of the Public Subnet Network ACL"
  value = {
    protocol   = var.public_egress_rule.protocol
    rule_no    = var.public_egress_rule.rule_no
    action     = var.public_egress_rule.action
    cidr_block = var.public_egress_rule.cidr_block
    from_port  = var.public_egress_rule.from_port
    to_port    = var.public_egress_rule.to_port
  }
}

output "public_subnet_acl_ingress_rules" {
  description = "Ingress rules of the Public Subnet Network ACL"
  value = {
    protocol   = var.public_ingress_rule.protocol
    rule_no    = var.public_ingress_rule.rule_no
    action     = var.public_ingress_rule.action
    cidr_block = var.public_ingress_rule.cidr_block
    from_port  = var.public_ingress_rule.from_port
    to_port    = var.public_ingress_rule.to_port
  }
}

output "private_subnet_acl_id" {
  description = "ID of the Private Subnet Network ACL"
  value       = aws_network_acl.PrivateSubnetACL.id
}

output "private_subnet_acl_vpc_id" {
  description = "VPC ID of the Private Subnet Network ACL"
  value       = aws_network_acl.PrivateSubnetACL.vpc_id
}

output "private_subnet_acl_egress_rules" {
  description = "Egress rules of the Private Subnet Network ACL"
  value = {
    protocol   = var.private_egress_rule.protocol
    rule_no    = var.private_egress_rule.rule_no
    action     = var.private_egress_rule.action
    cidr_block = var.private_egress_rule.cidr_block
    from_port  = var.private_egress_rule.from_port
    to_port    = var.private_egress_rule.to_port
  }
}

output "private_subnet_acl_ingress_rules" {
  description = "Ingress rules of the Private Subnet Network ACL"
  value = {
    protocol   = var.private_ingress_rule.protocol
    rule_no    = var.private_ingress_rule.rule_no
    action     = var.private_ingress_rule.action
    cidr_block = var.private_ingress_rule.cidr_block
    from_port  = var.private_ingress_rule.from_port
    to_port    = var.private_ingress_rule.to_port
  }
}
