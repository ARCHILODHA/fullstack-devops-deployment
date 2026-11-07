# AWS Secrets Manager Configuration

variable "application_secret_name" {
  description = "Name of the application secret"
  type        = string
  default     = "application/database-credentials"
}

resource "aws_secretsmanager_secret" "application_secret" {
  name                    = var.application_secret_name
  description             = "Application database credentials"
  recovery_window_in_days = 7

  tags = {
    Name        = "application-secret"
    Environment = "production"
  }
}

output "secret_arn" {
  description = "Secrets Manager secret ARN"
  value       = aws_secretsmanager_secret.application_secret.arn
}
