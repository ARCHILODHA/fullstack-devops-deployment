# CloudWatch Log Group

resource "aws_cloudwatch_log_group" "logs" {
  name              = "/terraform/application"
  retention_in_days = 14
}
