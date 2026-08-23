# Backup Integrity Verification

## Purpose

Backup integrity verification ensures that stored backups can actually be used during recovery.

## Verification Methods

Backups can be verified using:

- Checksums
- Hash comparison
- File count validation
- Database consistency checks
- Test restores

## Checksum Example

```bash
sha256sum backup.tar.gz
