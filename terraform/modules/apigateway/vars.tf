variable "api_gateway_name" {
  description = "the name of api gateway"
  type        = string
}  

variable "vpc_link_name" {
  description = "the name of vpc link between ALB & API Gateway"
  type        = string
}

variable "tags" {
  description = "A map of tags to apply to the resources"
  type        = map(string)

}

variable "alb_arn" {
  description = "List of target ARNs"
  type        = list(string)
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

variable "alb_dnsname" {
  type = string
}