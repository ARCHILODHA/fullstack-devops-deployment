# Vault Leasing and TTL

## 1. Introduction

Vault uses leases to control how long certain secrets remain valid. A lease defines the duration for which a secret can be used before it expires or needs renewal.

Leases are especially important when working with dynamic secrets.

## 2. What Is a Lease?

A lease is a time-based agreement between Vault and a client.

It contains:
- Lease ID
- Lease duration
- Renewable status
- Expiration information

## 3. Time to Live (TTL)

TTL specifies how long a secret or token remains valid.

Example:

```bash
vault read database/creds/app-role
