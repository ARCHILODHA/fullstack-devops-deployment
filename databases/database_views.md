# Database Views

## What is a View?

A virtual table created using a SQL query.

Example:

```sql
CREATE VIEW active_users AS
SELECT * FROM users
WHERE status='ACTIVE';
```

## Advantages

- Hide complexity
- Security
- Reusable queries

## Limitations

- Some views are not updatable
- Performance depends on underlying query
```
