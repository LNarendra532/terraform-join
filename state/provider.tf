terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }
   backend "s3" {
    bucket = "nare84s-remote-statefile"
    key    = "remote_statefile_demo"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true # Enable native S3 locking
    # dynamodb_table = "nare84s-remote-statefile"
  }
}


provider "aws" {
  # Configuration options
}