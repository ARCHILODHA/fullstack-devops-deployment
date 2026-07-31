# Vault Secret Engines

## What is a Secret Engine?

A secret engine is responsible for storing or generating secrets.

Popular Engines

1. KV
2. Database
3. AWS
4. Azure
5. PKI
6. Transit
7. SSH

Example

```
vault secrets enable kv
```

List Engines

```
vault secrets list
```

Benefits

- Modular
- Secure
- Easy to configure
