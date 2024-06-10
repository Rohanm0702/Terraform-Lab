terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_s3_bucket" "application_files" {
  bucket = var.application_files_bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "static_assets" {
  bucket = var.static_assets_bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }
}
