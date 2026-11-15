
# Vault Secrets Delivery

## 1. Introduction

Secrets delivery describes how applications securely receive credentials and configuration values from Vault.

Instead of storing sensitive values directly in application source code, applications can retrieve them securely when needed.

## 2. Secrets Delivery Methods

Common approaches include:

- Vault Agent
- Vault Agent Templates
- Application API integration
- Kubernetes integration
- Response wrapping
- Dynamic secrets

## 3. Vault Agent

Vault Agent is a client-side daemon that can authenticate with Vault and manage token renewal.

It can also render secrets into files using templates.

## 4. Example Vault Agent Configuration

```hcl
pid_file = "./vault-agent.pid"

vault {
  address = "https://vault.example.com:8200"
}

auto_auth {
  method "approle" {
    mount_path = "auth/approle"

    config = {
      role_id_file_path = "./role-id"
      secret_id_file_path = "./secret-id"
    }
  }

  sink "file" {
    config = {
      path = "./vault-token"
    }
  }
}
