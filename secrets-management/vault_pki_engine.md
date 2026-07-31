# Vault PKI Engine

## Overview

Vault PKI engine issues SSL/TLS certificates.

Uses

- HTTPS
- Internal Services
- Kubernetes
- Microservices

Commands

Enable PKI

```
vault secrets enable pki
```

Generate Certificate

```
vault write pki/root/generate/internal common_name="example.com"
```

Benefits

- Certificate automation
- Easy renewal
- Centralized management
