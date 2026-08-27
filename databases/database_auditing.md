# Database Auditing

Database auditing records important database activities such as inserts, updates, deletes, logins, and schema changes.

## Why Auditing Is Important

- Tracks who changed data
- Helps investigate security incidents
- Supports compliance requirements
- Detects suspicious activity
- Provides accountability

## Common Audited Operations

| Operation | Example |
|---|---|
| INSERT | New user created |
| UPDATE | Customer information changed |
| DELETE | Record removed |
| LOGIN | Database user authenticated |
| DDL | Table structure changed |

## Example Audit Table

```sql
CREATE TABLE audit_log (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100),
    operation VARCHAR(50),
    table_name VARCHAR(100),
    record_id BIGINT,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
