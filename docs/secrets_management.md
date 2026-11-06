# Secrets Management

## Overview
Secrets management is the process of securely storing, accessing, rotating, and controlling sensitive application information.

Examples include:
- Database passwords.
- API keys.
- Access tokens.
- SSH private keys.
- Encryption keys.
- Cloud credentials.

## Why Secrets Management Is Important

- Prevents unauthorized access.
- Protects confidential information.
- Reduces credential exposure.
- Supports security compliance.
- Improves access control.

## Common Secrets Management Tools

### 1. AWS Secrets Manager
- Stores application secrets.
- Supports secret rotation.
- Integrates with AWS services.

### 2. HashiCorp Vault
- Centralized secrets management.
- Dynamic secret generation.
- Access policies and auditing.

### 3. Kubernetes Secrets
- Stores sensitive configuration data.
- Makes secrets available to workloads.
- Can be integrated with external secret managers.

### 4. Azure Key Vault
- Stores secrets, keys, and certificates.
- Integrates with Azure services.

## Example: Kubernetes Secret

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: database-secret
type: Opaque
stringData:
  DB_USERNAME: app_user
  DB_PASSWORD: replace-with-secret
