

# TLS and SSL Configuration

## Introduction
TLS (Transport Layer Security) protects data transmitted between systems.

SSL is an older protocol and is deprecated.

## Why TLS Matters

- Confidentiality.
- Integrity.
- Server authentication.
- Protection against interception.

## HTTPS
HTTPS uses TLS to protect HTTP communication.

## Security Best Practices

1. Use modern TLS versions.
2. Disable obsolete SSL and TLS versions.
3. Use trusted certificates.
4. Renew certificates before expiration.
5. Protect private keys.
6. Configure secure cipher suites.
7. Redirect HTTP to HTTPS where appropriate.

## Certificate Components

- Certificate: Identifies the server.
- Private key: Used in cryptographic operations.
- Certificate authority: Trusted organization that issues certificates.
- Certificate chain: Connects the certificate to a trusted authority.

## Check Certificate

```bash
openssl s_client -connect example.com:443
