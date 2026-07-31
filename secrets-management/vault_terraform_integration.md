# Vault Terraform Integration

## Overview

Terraform can retrieve secrets directly from Vault.

Benefits

- Secure Infrastructure as Code
- No plaintext passwords
- Centralized secret management

Example

```hcl
provider "vault" {
  address = "http://127.0.0.1:8200"
}
```

Retrieve Secret

```hcl
data "vault_kv_secret_v2" "db" {
  mount = "secret"
  name  = "database"
}
```
