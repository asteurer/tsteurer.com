terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_token
}

provider "aws" {
  region = var.aws_region
}

####################################
# VARIABLES
####################################

variable "aws_region" {
    type = string
}

variable "cloudflare_token" {
    type = string
}

variable "cloudflare_zone" {
    type = string
}

####################################
# S3 BUCKET
####################################

resource "aws_s3_bucket" "static_files" {
    bucket = "tsteurer.com"
}

resource "aws_s3_bucket_website_configuration" "static_files" {
    bucket = aws_s3_bucket.static_files.id

    index_document {
      suffix = "index.html"
    }

    error_document {
      key = "index.html"
    }
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

####################################
# CLOUDFLARE
####################################
# I wasn't able to find a way to add 'flexible SSL/TLS' mode + 'Always Use HTTPS' in the Edge Certificates tab, so that had to be set in the GUI.
resource "cloudflare_record" "www" {
  zone_id = var.cloudflare_zone
  name    = "www"
  content =  aws_s3_bucket_website_configuration.static_files.website_endpoint
  type    = "CNAME"
  proxied = true
  ttl     = 1
}

resource "cloudflare_record" "root" {
  zone_id = var.cloudflare_zone
  name    = "@"
  content =  aws_s3_bucket_website_configuration.static_files.website_endpoint
  type    = "CNAME"
  proxied = true
  ttl     = 1
}