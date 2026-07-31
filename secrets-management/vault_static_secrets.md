# Vault Static Secrets

## Overview

Static secrets remain unchanged until manually updated.

Examples:
- API Keys
- Database Passwords
- SSH Keys
- JWT Secrets

## Storage

Vault KV Engine stores static secrets.

Example

```
secret/app

username=admin
password=StrongPassword123
```

## Advantages

- Easy management
- Version history
- Secure storage
