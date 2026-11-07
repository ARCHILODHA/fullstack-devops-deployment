# EBS Volume Configuration

variable "ebs_availability_zone" {
  description = "Availability Zone for the EBS volume"
  type        = string
}

variable "ebs_volume_size" {
  description = "EBS volume size in GB"
  type        = number
  default     = 20
}

variable "ebs_volume_type" {
  description = "EBS volume type"
  type        = string
  default     = "gp3"
}

resource "aws_ebs_volume" "app_storage" {
  availability_zone = var.ebs_availability_zone
  size              = var.ebs_volume_size
  type              = var.ebs_volume_type
  encrypted         = true

  tags = {
    Name        = "application-storage"
    Environment = "production"
  }
}

output "ebs_volume_id" {
  description = "Created EBS volume ID"
  value       = aws_ebs_volume.app_storage.id
}

output "ebs_volume_arn" {
  description = "Created EBS volume ARN"
  value       = aws_ebs_volume.app_storage.arn
}
