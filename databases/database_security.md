# Database Security

## Best Practices

- Strong passwords
- Least privilege access
- Encryption
- Backups
- SQL Injection prevention

## SQL Injection Example

Unsafe

```sql
SELECT * FROM users WHERE name=' " + input + " ';
```

Safe

```sql
PreparedStatement
Parameterized Query
```

## Additional Security

- Firewalls
- SSL/TLS
- Audit logging
- Role Based Access Control (RBAC)
