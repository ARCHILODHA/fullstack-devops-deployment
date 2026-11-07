# AWS VPC Endpoint Configuration

variable "endpoint_vpc_id" {
  description = "VPC ID for the endpoint"
  type        = string
}

variable "endpoint_route_table_ids" {
  description = "Route table IDs for the S3 gateway endpoint"
  type        = list(string)
}

resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id            = var.endpoint_vpc_id
  service_name      = "com.amazonaws.${data.aws_region.current.name}.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = var.endpoint_route_table_ids

  tags = {
    Name        = "s3-vpc-endpoint"
    Environment = "production"
  }
}

data "aws_region" "current" {}

output "s3_vpc_endpoint_id" {
  description = "S3 VPC endpoint ID"
  value       = aws_vpc_endpoint.s3_endpoint.id
}
