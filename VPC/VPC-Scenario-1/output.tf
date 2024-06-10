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

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.VPCSecurityGroup.id
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
