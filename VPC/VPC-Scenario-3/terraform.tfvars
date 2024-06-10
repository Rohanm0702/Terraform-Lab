vpc_cidr_block = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"
public_subnet_route_cidr = "0.0.0.0/24"
private_subnet_route_cidr = "10.0.2.0/24"
public_ingress_rule = {
  protocol   = "tcp"
  rule_no    = 100
  action     = "allow"
  cidr_block = "0.0.0.0/0"
  from_port  = 80
  to_port    = 80
}

public_egress_rule = {
  protocol   = "tcp"
  rule_no    = 100
  action     = "allow"
  cidr_block = "0.0.0.0/0"
  from_port  = 0
  to_port    = 0
}

private_ingress_rule = {
  protocol   = "tcp"
  rule_no    = 200
  action     = "allow"
  cidr_block = "10.0.0.0/16"
  from_port  = 443
  to_port    = 443
}

private_egress_rule = {
  protocol   = "tcp"
  rule_no    = 200
  action     = "allow"
  cidr_block = "0.0.0.0/0"
  from_port  = 0
  to_port    = 0
}

