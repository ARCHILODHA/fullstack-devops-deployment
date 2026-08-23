
# Backup Access Control

## Purpose

Backup systems contain potentially sensitive information and must be protected using strict access controls.

## Principles

Backup access should follow:

- Least privilege
- Role-based access control
- Separation of duties
- Strong authentication
- Regular access reviews

## Example Roles

| Role | Permissions |
|---|---|
| Backup Operator | Create and monitor backups |
| Backup Administrator | Configure backup systems |
| Security Team | Audit backup security |
| Developer | Read approved development backups |
| Auditor | Read audit information |

## Credential Management

Backup credentials should:

- Never be stored directly in source code.
- Be stored in a secure secret manager.
- Be rotated periodically.
- Have minimum required permissions.

## Administrative Access

Administrative backup operations should require MFA wherever supported.

## Access Review

Backup permissions should be reviewed periodically and immediately after employee role changes.
