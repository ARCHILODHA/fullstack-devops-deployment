# AWS Elastic IP Configuration

variable "eip_domain" {
  description = "Domain for Elastic IP allocation"
  type        = string
  default     = "vpc"
}

resource "aws_eip" "application_eip" {
  domain = var.eip_domain

  tags = {
    Name        = "application-elastic-ip"
    Environment = "production"
  }
}

output "elastic_ip_address" {
  description = "Allocated public Elastic IP address"
  value       = aws_eip.application_eip.public_ip
}

output "elastic_ip_allocation_id" {
  description = "Elastic IP allocation ID"
  value       = aws_eip.application_eip.id
}
