#terraform 설정
terraform {
  required_version = ">=1.9.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.73.0"
    }
  }
}

# AWS 프로바이더 설정
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# s3 설정
resource "aws_s3_bucket" "example" {
  bucket = "my-existing-bucket-20260802111623"
}

import {
  to = aws_s3_bucket.example
  id = "my-existing-bucket-20260802111623"
}
