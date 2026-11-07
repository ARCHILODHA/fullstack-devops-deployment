# AWS Simple Notification Service Configuration

variable "sns_topic_name" {
  description = "SNS notification topic name"
  type        = string
  default     = "application-alerts"
}

variable "sns_notification_email" {
  description = "Email address for notifications"
  type        = string
}

resource "aws_sns_topic" "application_alerts" {
  name = var.sns_topic_name

  tags = {
    Name        = "application-alerts"
    Environment = "production"
  }
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.application_alerts.arn
  protocol  = "email"
  endpoint  = var.sns_notification_email
}

output "sns_topic_arn" {
  description = "SNS topic ARN"
  value       = aws_sns_topic.application_alerts.arn
}
