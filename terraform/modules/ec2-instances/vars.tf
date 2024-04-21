variable "ami_id" {
  type = string
  default = "ami-0dba2cb6798deb6d8"
  description = "the AMI ID for UBUNTU 20.04"
}

variable "private_subnet_ids" {
  type = string
}

variable "public_subnet_ids" {
  type = string
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
  type    = string
  default = "dev"
}

variable "web_sg_id" {
  type = list(string)
}