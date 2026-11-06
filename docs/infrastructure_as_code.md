
# Infrastructure as Code (IaC)

## Overview
Infrastructure as Code is the practice of managing and provisioning infrastructure through machine-readable configuration files instead of manual processes.

It allows teams to create consistent and repeatable infrastructure environments.

## Why Infrastructure as Code Is Important

- Automates infrastructure provisioning.
- Reduces manual configuration errors.
- Improves consistency.
- Supports version control.
- Makes infrastructure changes repeatable.

## Popular IaC Tools

### 1. Terraform
- Open-source infrastructure provisioning tool.
- Supports multiple cloud providers.
- Uses declarative configuration files.

### 2. AWS CloudFormation
- AWS infrastructure provisioning service.
- Uses JSON or YAML templates.
- Integrates with AWS services.

### 3. Ansible
- Automates configuration management.
- Uses YAML playbooks.
- Supports application and server configuration.

### 4. Pulumi
- Allows infrastructure definitions using programming languages.
- Supports multiple cloud platforms.

## Terraform Example

```hcl
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web_server" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t3.micro"

  tags = {
    Name = "DevOps-Web-Server"
  }
}
