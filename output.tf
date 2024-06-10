output "FirstVPC_ID" {
  description = "VPC ID"
  value       = aws_vpc.FirstVPC.id
}

output "FirstSubnet_ID" {
  description = "public subnet ID"
  value       = aws_subnet.FirstSubnet.id
}
output "FirstSubnetRouteTable_ID" {
  description = "public subnet route table ID"
  value       = aws_route_table.FirstSubnetRouteTable.id
}

output "FirstSubnetRouteTableAssociation_ID" {
  description = "The ID of the main route table association for the public subnet"
  value       = aws_main_route_table_association.FirstSubnetRouteTableAssociation.id
}

output "FirstVPCSecurityGroup_ID" {
  description = "The ID of the security group"
  value       = aws_security_group.FirstVPCSecurityGroup.id
}

output "SecondVPC_ID" {
  description = "VPC ID"
  value       = aws_vpc.SecondVPC.id
}

output "SecondSubnet_ID" {
  description = "Tprivate subnet ID"
  value       = aws_subnet.SecondSubnet.id
}

output "SecondSubnetRouteTable_ID" {
  description = "private subnet route table ID"
  value       = aws_route_table.SecondSubnetRouteTable.id
}

output "SecondSubnetRouteTableAssociation_ID" {
  description = "The ID of the main route table association for the private subnet"
  value       = aws_main_route_table_association.SecondSubnetRouteTableAssociation.id
}

output "SecondVPCSecurityGroup_ID" {
  description = "The ID of the security group"
  value       = aws_security_group.SecondVPCSecurityGroup.id
}

