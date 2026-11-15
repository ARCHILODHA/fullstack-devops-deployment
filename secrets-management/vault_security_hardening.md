
# Vault Security Hardening

## 1. Introduction

Vault security hardening involves configuring Vault and its surrounding infrastructure to reduce security risks.

A properly hardened Vault deployment protects credentials, encryption keys, and sensitive application data.

## 2. Security Hardening Areas

Important areas include:

- Network security
- Authentication
- Authorization
- TLS configuration
- Audit logging
- Token management
- Storage protection
- Backup security

## 3. Enable TLS

Vault should use HTTPS to protect communication between clients and servers.

Example configuration:

```hcl
listener "tcp" {
  address       = "0.0.0.0:8200"
  tls_cert_file = "/etc/vault/tls/vault.crt"
  tls_key_file  = "/etc/vault/tls/vault.key"
}
