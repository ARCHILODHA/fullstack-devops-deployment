
# Vault Access Control

## 1. Introduction

Access control determines which users and applications can access secrets and perform operations inside Vault.

Vault uses policies and authentication methods to provide controlled access to sensitive information.

## 2. Access Control Components

Important components include:

- Authentication methods
- Tokens
- Policies
- Identity groups
- Entity aliases
- Capabilities

## 3. Vault Policies

Policies define what operations a user or application can perform.

Example policy:

```hcl
path "secret/data/application/*" {
  capabilities = ["read", "list"]
}
