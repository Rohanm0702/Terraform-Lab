variable "storage"{
    type=number
    description = "Enter the storage for rdslab"
} 
variable "db_name" {
    type=string
    description = "Enter the name of the db"
}
variable "engine"{
    type=string
    description="Enter the engine type(MySQL)"
}
variable "engine_version" {
    type=string
    description = "The db engine version"
}
variable "instance_class" {
    type=string
    description = "The instance class to be used by rds"
}
variable "username" {
    type=string
    description = "The username of the db"
}
variable "password" {
    type=string
    sensitive = true
}
variable "parameter_group_name" {
    type=string
    description = "The parameter group name"
}
variable "skip_final_snapshot" {
    type=bool
    description = "Whether to skip the final snapshot before deletion" 
}
variable "vpc_cidr" {
    type=string
    description = "The vpc of the db"
}
variable "subnet_cidr-1" {
    type=string
    description = "The subnet-1 of the db"
}
variable "subnet_cidr-2" {
    type=string
    description = "The subnet-2 of the db"
}
variable "az1" {
    type=string
    description = "The availabilty zone of subnet-1"
}
variable "az2" {
    type=string
    description = "The availabilty zone of subnet-2"
}
