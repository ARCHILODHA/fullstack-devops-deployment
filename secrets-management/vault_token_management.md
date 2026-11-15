
# Vault Token Management

## 1. Introduction

Vault tokens are used to authenticate clients and authorize access to Vault resources.

Proper token management is essential because tokens provide access according to their assigned policies.

## 2. What Is a Vault Token?

A Vault token is a credential used to access Vault APIs.

Tokens contain or reference information such as:

- Token policies
- Token TTL
- Renewable status
- Accessor
- Token type

## 3. Create a Token

Create a token:

```bash
vault token create
