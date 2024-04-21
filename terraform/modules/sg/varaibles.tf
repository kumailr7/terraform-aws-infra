
variable "vpc_id" {}

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
