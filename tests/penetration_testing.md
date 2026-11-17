
# Penetration Testing

## 1. Introduction

Penetration Testing is a security assessment technique that simulates authorized attacks against an application or infrastructure.

Its purpose is to identify exploitable vulnerabilities before malicious attackers can use them.

## 2. What Is Penetration Testing?

Penetration testing evaluates the security of systems by attempting controlled exploitation of weaknesses.

It may cover:

- Web applications
- APIs
- Networks
- Cloud infrastructure
- Mobile applications
- Authentication systems

## 3. Types of Penetration Testing

### Black Box Testing

The tester has little or no internal knowledge of the target.

### White Box Testing

The tester has access to source code, architecture, and system information.

### Grey Box Testing

The tester has partial knowledge of the target environment.

## 4. Penetration Testing Phases

1. Planning and authorization.
2. Scope definition.
3. Information gathering.
4. Vulnerability identification.
5. Controlled exploitation.
6. Impact assessment.
7. Reporting.
8. Remediation and retesting.

## 5. Common Vulnerabilities

- SQL injection
- Cross-site scripting
- Broken authentication
- Broken access control
- Security misconfiguration
- Insecure direct object references
- Sensitive data exposure

## 6. Example: Authorized Local Security Scan

Use OWASP ZAP against an application you own or are explicitly authorized to test.

A local baseline scan can be started with:

```bash
docker run --rm \
  -t ghcr.io/zaproxy/zaproxy:stable \
  zap-baseline.py \
  -t http://host.docker.internal:3000
