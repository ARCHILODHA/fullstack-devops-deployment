# AWS Key Management Service Configuration

resource "aws_kms_key" "application_key" {
  description             = "KMS key for application data encryption"
  deletion_window_in_days = 30
  enable_key_rotation     = true

  tags = {
    Name        = "application-encryption-key"
    Environment = "production"
  }
}

resource "aws_kms_alias" "application_alias" {
  name          = "alias/application-encryption"
  target_key_id = aws_kms_key.application_key.key_id
}

output "kms_key_id" {
  description = "KMS key ID"
  value       = aws_kms_key.application_key.key_id
}

output "kms_key_arn" {
  description = "KMS key ARN"
  value       = aws_kms_key.application_key.arn
}
