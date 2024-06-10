variable "FirstVPC_cidr" {
  description = "CIDR block for the first VPC"
  type        = string
}

variable "SecondVPC_cidr" {
  description = "CIDR block for the second VPC"
  type        = string
}

variable "FirstSubnet_cidr" {
  description = "The public subnet CIDR block"
  type        = string
}

variable "FirstSubnetRouteTable_cidr" {
  description = "The public subnet route CIDR block"
  type        = string
}

variable "SecondSubnet_cidr" {
  description = "The private subnet CIDR block"
  type        = string
}


variable "SecondSubnetRouteTable_cidr" {
  description = "The private subnet route CIDR block"
  type        = string
}


variable "ssh_cidr_block" {
  description = "SSH access cidr block"
  type        = list(string)
}

variable "http_cidr_block" {
  description = "HTTP access cidr block"
  type        = list(string)
}
