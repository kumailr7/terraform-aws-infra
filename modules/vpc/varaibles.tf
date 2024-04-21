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
