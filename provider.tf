terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.49"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  assume_role {
    role_arn = "arn:aws:iam::950642265959:role/CLD-SS-Automation-Admin"
  }
}
