variable "alb_name" {
  type = string
  description = "the name of ALB"
}

variable "alb_sg_id" {
  type = set(string)
  description = "the SG of ALB"
  default = [ ]
}

variable "public_subnet_ids" {
  type = list(any)
  description = "the ID Subnet of public"
}

variable "vpc_id" {
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
  type        = string
  default = "dev"
}