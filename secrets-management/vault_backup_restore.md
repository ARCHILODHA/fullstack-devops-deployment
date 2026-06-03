
# Vault Backup and Restore

Backup storage data regularly.

Example snapshot:

```bash
vault operator raft snapshot save backup.snap

Restore:

vault operator raft snapshot restore backup.snap
