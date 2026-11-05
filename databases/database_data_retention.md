
# Database Data Retention

## Overview
Database data retention defines how long information should be stored before it is archived or deleted.

Organizations use retention policies to manage storage, meet legal requirements, and protect sensitive information.

## Why Data Retention Matters

- Controls database growth.
- Reduces unnecessary storage expenses.
- Supports regulatory compliance.
- Limits unnecessary retention of sensitive data.
- Improves data lifecycle management.

## Common Retention Categories

### 1. Transaction Data
Records of payments, purchases, and financial activities.

### 2. Application Logs
Records of application events and system activity.

### 3. User Data
Information associated with registered users.

### 4. Audit Records
Records of database and administrative activities.

### 5. Temporary Data
Short-lived information used during application processing.

## Retention Policy Components

- Data category.
- Retention duration.
- Storage location.
- Archiving procedure.
- Deletion procedure.
- Responsible owner.
- Compliance requirements.

## Example Retention Policy

| Data Type | Example Retention |
|---|---|
| Application logs | 90 days |
| Temporary records | 30 days |
| Archived reports | 2 years |
| Audit records | Based on compliance requirements |
| Customer records | Based on business and legal requirements |

These durations are illustrative and must be adjusted to applicable laws and organizational policies.

## Example SQL

Delete expired temporary records:

```sql
DELETE FROM temporary_sessions
WHERE expires_at < CURRENT_TIMESTAMP;
