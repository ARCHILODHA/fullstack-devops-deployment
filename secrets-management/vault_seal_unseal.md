

# Vault Seal and Unseal

## 1. Introduction

Vault uses a seal mechanism to protect its encrypted data. When Vault is sealed, it cannot access its protected data or process normal secret requests.

Unsealing allows Vault to access the encryption keys required to operate.

## 2. What Is Sealing?

Sealing is the process of locking Vault.

When Vault is sealed:

- Secret access is disabled.
- Normal API operations are unavailable.
- Protected data cannot be decrypted.
- Administrative unseal operations remain available.

## 3. What Is Unsealing?

Unsealing is the process of providing the required key material to allow Vault to operate.

Depending on the configured seal mechanism, this may involve unseal key shares or an automated key management service.

## 4. Check Vault Seal Status

```bash
vault status
