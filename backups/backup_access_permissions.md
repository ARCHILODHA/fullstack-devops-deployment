

# Backup Access Permissions

## Overview
Backup access permissions control who can create, read, modify, restore, or delete backup data.

## Security Principles
- Apply least privilege.
- Use dedicated service accounts.
- Restrict access to backup directories.
- Separate backup operators from administrators where practical.
- Review permissions periodically.
- Record sensitive backup operations.

## Linux Example

Create a dedicated backup directory:

```bash
sudo mkdir -p /var/backups/application
