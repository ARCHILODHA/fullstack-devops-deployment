# Vault Transit Secret Engine

## Purpose

The Transit Engine encrypts and decrypts data without storing it.

Applications

- Token encryption
- Credit card protection
- Password encryption
- Secure messaging

Commands

Create Key

```
vault write -f transit/keys/mykey
```

Encrypt

```
vault write transit/encrypt/mykey plaintext=$(echo "hello" | base64)
```

Decrypt

```
vault write transit/decrypt/mykey ciphertext=<ciphertext>
```
