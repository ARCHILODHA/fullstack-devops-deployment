
# Vault Identity Management

## 1. Introduction

Vault Identity is used to manage identities and associate them with policies. It allows users and applications to receive permissions based on their identity rather than relying only on individual authentication methods.

## 2. What Is Vault Identity?

Vault Identity provides a centralized identity management system.

It includes:

- Entities
- Entity aliases
- Groups
- Group aliases
- Identity policies

## 3. Entities

An entity represents a user or application identity inside Vault.

Create an entity:

```bash
vault write identity/entity name="developer"
