# AWS CloudWatch Alarm Configuration

variable "alarm_ec2_instance_id" {
  description = "EC2 instance ID to monitor"
  type        = string
}

variable "alarm_cpu_threshold" {
  description = "CPU utilization threshold"
  type        = number
  default     = 80
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "high-ec2-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"

  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = var.alarm_cpu_threshold

  alarm_description = "Triggered when EC2 CPU utilization remains high."

  dimensions = {
    InstanceId = var.alarm_ec2_instance_id
  }

  treat_missing_data = "notBreaching"

  tags = {
    Name        = "ec2-cpu-alarm"
    Environment = "production"
  }
}

output "cloudwatch_alarm_name" {
  description = "CloudWatch alarm name"
  value       = aws_cloudwatch_metric_alarm.high_cpu.alarm_name
}
