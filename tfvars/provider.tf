terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.66.0"
    }
  }

  # terraform init -backend-config="path of file"
  backend "s3" {}
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}