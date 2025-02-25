#################################################################################
# Providers
#################################################################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}


variable "aws_region" {
  type = string
}

variable "domain" {
  type = string
}

locals {
  name_tag = { "Name" = "${var.domain}" }
}


#################################################################################
# S3 Bucket
#################################################################################

resource "aws_s3_bucket" "static_files" {
  bucket        = "${var.domain}-prod"
  force_destroy = true
}

# Configure public access settings
resource "aws_s3_bucket_public_access_block" "static_files" {
  bucket = aws_s3_bucket.static_files.id

  # Block all public ACLs
  block_public_acls  = true
  ignore_public_acls = true

  # Allow public bucket policies
  block_public_policy     = false
  restrict_public_buckets = false
}

# Attach a bucket policy to allow public read access
resource "aws_s3_bucket_policy" "static_files" {
  bucket = aws_s3_bucket.static_files.id

  # Ensure public access settings are applied first
  depends_on = [aws_s3_bucket_public_access_block.static_files]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.static_files.arn}/*"
      }
    ]
  })
}

output "s3_bucket_name" {
  value = aws_s3_bucket.static_files.bucket
}