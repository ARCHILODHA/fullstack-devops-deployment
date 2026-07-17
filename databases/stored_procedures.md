# Stored Procedures

## Definition

A stored procedure is a precompiled collection of SQL statements stored in the database.

Example

```sql
CREATE PROCEDURE GetUsers()
BEGIN
SELECT * FROM users;
END;
```

## Benefits

- Faster execution
- Code reuse
- Better security
- Reduced network traffic

## Drawbacks

- Vendor specific
- Harder debugging
