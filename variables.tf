###### TAGS #######
variable "tags" {
  description = "A map of tags to apply to the resources"
  type        = map(string)

}


###### VPC ########
variable "create_vpc" {
   description = "Controls if VPC should be created(it affects almost all resources)"
   type = bool
}

variable "cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "enable_dns_support" {
  description = "Whether DNS support is enabled for the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Whether DNS hostnames are enabled for the VPC"
  type        = bool
  default     = true
}

variable "instance_tenancy" {
  description = "The instance tenancy for the VPC"
  type        = string
}


###### SUBNETS ######
variable "availability_zones" {
  type    = list(string)
  description = "List of availability zones"
}

variable "public_subnet_cidr_prefixes" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets in each AZ"
}

variable "private_subnet_cidr_prefixes" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets in each AZ"
}

variable "igw_id" {
  type = string
}

variable "ip_range" {
  type =string
}

variable "vpc_id" {
  type = string
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type = string
}

variable "private_ip" {
  description = "should be true to be enabled DNS hostnames in the VPC"
  type = bool
}

variable "public_ip" {
  description = "should be true to be enabled DNS hostnames in the VPC"
  type = bool
}

######## SECURITY GROUP ########
variable "instance_ingress_ports" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  }))
}


variable "alb_ingress_ports" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  }))
}

###### ALB ######
variable "alb_name" {
  type = string
}

#### API GATEWAY #####
variable "api_gateway_name" {
  type = string
}

variable "vpc_link_name" {
  type = string
}

variable "key_name" {
  type = string
}