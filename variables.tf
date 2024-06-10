variable "vpc_cidr_block" {
  description = "The VPC CIDR block"
  type        = string
}

variable "public_subnet_cidr" {
  description = "The public subnet CIDR block"
  type        = string
}

variable "private_subnet_cidr" {
  description = "The private subnet CIDR block"
  type        = string
}

variable "public_subnet_route_cidr" {
  description = "The public subnet route CIDR block"
  type        = string
}

variable "private_subnet_route_cidr" {
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
