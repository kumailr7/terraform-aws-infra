variable "vpc_id" {
  description = "the vaule of the vpc id"
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