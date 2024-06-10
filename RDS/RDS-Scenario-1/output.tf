output "db_instance_identifier" {
  description = "The RDS instance identifier"
  value       = aws_db_instance.labrds.id
}
output "db_instance_name" {
  description = "The database name"
  value       = aws_db_instance.labrds.db_name
}
output "db_engine" {
    description = "The database engine"
    value=aws_db_instance.labrds.engine
  
}
output "db_engine_version"{
    description = "The engine version"
    value=aws_db_instance.labrds.engine_version
}
output "db_instance_class" {
    description = "The database instance class"
    value=aws_db_instance.labrds.instance_class
}
output "vpc_cidr" {
    description = "The vpc cidr"
    value=aws_vpc.vpc.cidr_block
}
output "subnet-1_cidr" {
    description = "The subnet cidr"
    value=aws_subnet.subnet_1.cidr_block
}
output "subnet-2_cidr" {
    description = "The subnet cidr"
    value=aws_subnet.subnet_2.cidr_block
}
