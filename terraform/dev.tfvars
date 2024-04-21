#####  DEFAULT TAGS #######

app         = "aws"
environment = "dev"

###### VPC  ########

create_vpc = true
cidr       = "10.10.0.0/16"
enable_dns_support = true
enable_dns_hostnames = true
instance_tenancy    = "default"
public_ip   = true
private_ip  = false

###### SUBNETS ######

availability_zones = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]

public_subnet_cidr_prefixes = ["10.10.20.0/24", "10.10.21.0/24", "10.10.22.0/24"]

private_subnet_cidr_prefixes = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]

###### SECURITY GROUP ######

##### EC2 instance #######

instance_ingress_ports = [
  [
    {
      description = "HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
    }
  ],
  [
    {
      description = "HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
    }
  ],
  [
    {
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
    }
  ]
]

###### ALB  ##########

alb_ingress_ports = [
  [
    {
      description = "HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
    }
  ],
  [
    {
      description = "HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
    }
  ],
  [
    {
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
    }
  ]
]

####### APPLICATION LOAD BALANCER ######
alb_name = "aws_infra_alb"

####### API GATEWAY #########
api_gateway_name = "aws_api_gateway"
vpc_link_name = "vpc_alb_api"

##### SSH-KEY ######
key_name = "kenshi"

