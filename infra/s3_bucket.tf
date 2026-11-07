# AWS S3 Bucket Configuration

variable "s3_bucket_name" {
  description = "Globally unique S3 bucket name"
  type        = string
}

resource "aws_s3_bucket" "application_storage" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = "application-storage"
    Environment = "production"
  }
}

# Enable bucket versioning

resource "aws_s3_bucket_versioning" "application_versioning" {
  bucket = aws_s3_bucket.application_storage.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.application_storage.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block public access

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.application_storage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

output "s3_bucket_name" {
  description = "Created S3 bucket name"
  value       = aws_s3_bucket.application_storage.bucket
}

output "s3_bucket_arn" {
  description = "Created S3 bucket ARN"
  value       = aws_s3_bucket.application_storage.arn
}
