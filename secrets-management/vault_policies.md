# Vault Policies

Vault policies define permissions for users and applications.

Example:
```hcl
path "secret/data/app/*" {
  capabilities = ["read"]
}
