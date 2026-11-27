
# Security Testing Checklist

## Introduction
Security testing identifies weaknesses in applications, infrastructure and deployment processes.

## Authentication

- [ ] Passwords are securely hashed.
- [ ] Authentication errors do not expose sensitive details.
- [ ] Sessions are securely managed.
- [ ] MFA is supported where appropriate.

## Authorization

- [ ] Access control is enforced server-side.
- [ ] Users cannot access unauthorized resources.
- [ ] Roles and permissions are reviewed.

## Input Validation

- [ ] Inputs are validated.
- [ ] SQL injection protections are implemented.
- [ ] XSS protections are implemented.
- [ ] File uploads are restricted.

## Network Security

- [ ] HTTPS is enabled.
- [ ] Unnecessary ports are closed.
- [ ] Firewall rules are reviewed.
- [ ] Sensitive services are not publicly exposed.

## Infrastructure

- [ ] Containers are securely configured.
- [ ] Secrets are not committed to repositories.
- [ ] Dependencies are scanned.
- [ ] Logs are monitored.

## Data Protection

- [ ] Sensitive data is encrypted appropriately.
- [ ] Backup processes are tested.
- [ ] Access to sensitive information is restricted.

## Testing Tools

- OWASP ZAP.
- Burp Suite.
- Trivy.
- Dependency scanners.

## Conclusion
A structured security checklist helps identify vulnerabilities before applications reach production.
