# Amazon RDS Database Configuration

variable "rds_subnet_ids" {
  description = "Private subnet IDs for the RDS subnet group"
  type        = list(string)
}

variable "rds_security_group_id" {
  description = "Security group ID for RDS"
  type        = string
}

variable "rds_username" {
  description = "Master database username"
  type        = string
}

variable "rds_password" {
  description = "Master database password"
  type        = string
  sensitive   = true
}

variable "rds_database_name" {
  description = "Initial database name"
  type        = string
  default     = "applicationdb"
}

variable "rds_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

resource "aws_db_subnet_group" "application_db_subnet" {
  name       = "application-db-subnet-group"
  subnet_ids = var.rds_subnet_ids

  tags = {
    Name = "application-db-subnet-group"
  }
}

resource "aws_db_instance" "application_database" {
  identifier = "application-database"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class    = var.rds_instance_class
  allocated_storage = 20
  storage_type      = "gp3"
  storage_encrypted = true

  db_name  = var.rds_database_name
  username = var.rds_username
  password = var.rds_password

  db_subnet_group_name   = aws_db_subnet_group.application_db_subnet.name
  vpc_security_group_ids = [var.rds_security_group_id]

  publicly_accessible = false
  multi_az            = false

  backup_retention_period = 7
  deletion_protection     = true
  skip_final_snapshot    = false
  final_snapshot_identifier = "application-database-final-snapshot"

  tags = {
    Name        = "application-database"
    Environment = "production"
  }
}

output "rds_endpoint" {
  description = "RDS database endpoint"
  value       = aws_db_instance.application_database.endpoint
}

output "rds_identifier" {
  description = "RDS database identifier"
  value       = aws_db_instance.application_database.identifier
}
