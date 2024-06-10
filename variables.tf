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

variable "public_egress_rule" {
  description = "Configuration for public egress rule"
  type = object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  })
}

variable "public_ingress_rule" {
  description = "Configuration for public ingress rule"
  type = object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  })
}

variable "private_egress_rule" {
  description = "Configuration for private egress rule"
  type = object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  })
}

variable "private_ingress_rule" {
  description = "Configuration for private ingress rule"
  type = object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  })
}
