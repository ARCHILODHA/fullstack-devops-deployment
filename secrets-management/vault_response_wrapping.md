
# Vault Response Wrapping

## 1. Introduction

Response wrapping is a Vault security feature that protects sensitive data during transfer between systems.

Instead of returning the actual secret directly, Vault returns a temporary wrapping token.

## 2. What Is Response Wrapping?

Response wrapping uses a temporary token to protect a response.

The receiving application must unwrap the token to access the original data.

This reduces the risk of exposing sensitive information through logs, scripts, or intermediate systems.

## 3. How It Works

1. An application requests a secret from Vault.
2. Vault generates a wrapping token.
3. The token is delivered to the intended recipient.
4. The recipient authenticates with Vault.
5. The recipient unwraps the token.
6. Vault returns the original secret.

## 4. Create a Wrapped Response

Example:

```bash
vault kv get -wrap-ttl=5m secret/application
