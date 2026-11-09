
## 8. `monitoring_security.md`

```markdown
# Monitoring System Security

## Overview
Monitoring systems collect sensitive infrastructure and application information. Their dashboards, metrics endpoints, logs, and APIs must be protected against unauthorized access.

## Common Security Risks

- Publicly exposed monitoring dashboards.
- Unauthorized access to metrics endpoints.
- Leakage of credentials in logs.
- Unprotected exporter endpoints.
- Insecure communication.
- Excessive user permissions.

## Security Controls

### 1. Authentication
Require authentication for monitoring dashboards and management interfaces.

### 2. Authorization
Use role-based access control to restrict permissions.

### 3. Network Restrictions
Keep monitoring endpoints on private networks wherever possible.

### 4. Encryption
Use TLS to protect communication between monitoring components.

### 5. Secrets Management
Store credentials in secure secret-management systems.

### 6. Audit Logging
Record important access and configuration changes.

## Example: Prometheus Behind Nginx

```nginx
server {
    listen 443 ssl;
    server_name prometheus.example.com;

    ssl_certificate /etc/nginx/ssl/fullchain.pem;
    ssl_certificate_key /etc/nginx/ssl/privkey.pem;

    location / {
        proxy_pass http://127.0.0.1:9090;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
