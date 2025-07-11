terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0"
    }
  }
  backend "s3" {
    bucket = "sridevsecops-dev-1"
    key = "expense-dev-infrastructure"
    region = "us-east-1"
    dynamodb_table = "sridevsecops-dev-tb-1"
    encrypt = true
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}