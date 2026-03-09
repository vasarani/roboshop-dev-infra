terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0"
    }
  }
  backend "s3" {
    bucket       = "rawsd-remote-state-dev"
    key          = "rawsd-roboshop-db"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
    dynamodb_table = "rawsd-remote-state-lock-dev"
  }
}

provider "aws" {
  region = "us-east-1"
}
