terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.46.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"   ### Mumbai Region
}