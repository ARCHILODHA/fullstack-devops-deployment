

# Backup Log Rotation

## Overview
Backup scripts generate logs that record job execution, errors, durations, and verification results. Log rotation prevents log files from consuming excessive disk space.

## Benefits
- Controls disk usage.
- Preserves recent diagnostic information.
- Simplifies troubleshooting.
- Supports operational auditing.
- Improves log management.

## Example Logrotate Configuration

Create a configuration file at:

/etc/logrotate.d/application-backup

```text
/var/log/application_backup.log {
    daily
    rotate 14
    compress
    missingok
    notifempty
    copytruncate
}
