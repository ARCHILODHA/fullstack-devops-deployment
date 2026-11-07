# AWS Route 53 DNS Configuration

variable "route53_zone_id" {
  description = "Route 53 hosted zone ID"
  type        = string
}

variable "route53_record_name" {
  description = "DNS record name"
  type        = string
}

variable "route53_alb_dns_name" {
  description = "Application Load Balancer DNS name"
  type        = string
}

variable "route53_alb_zone_id" {
  description = "Canonical hosted zone ID of the ALB"
  type        = string
}

resource "aws_route53_record" "application_dns" {
  zone_id = var.route53_zone_id
  name    = var.route53_record_name
  type    = "A"

  alias {
    name                   = var.route53_alb_dns_name
    zone_id                = var.route53_alb_zone_id
    evaluate_target_health = true
  }
}

output "application_dns_name" {
  description = "Application DNS record"
  value       = aws_route53_record.application_dns.fqdn
}
