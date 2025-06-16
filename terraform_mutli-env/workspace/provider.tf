terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }

  backend "s3" {
    bucket = "nare84s-remote-dev"
    key    = "workspace-demo"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true # Enable native S3 locking
  }
}

provider "aws" {
  # Configuration options
}