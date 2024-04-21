// variables.tf

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

variable "tags" {
  description = "A map of tags to apply to the resources"
  type        = map(string)
}

variable "app" {
  description = "Name of the application"
  type        = string
  default = "aws"
}

variable "environment" {
  description = "Name of the environment"
  type        = string
  default = "dev"
}