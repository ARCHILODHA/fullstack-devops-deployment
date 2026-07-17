# Database Triggers

## What is a Trigger?

A trigger automatically executes when a database event occurs.

Events

- INSERT
- UPDATE
- DELETE

Example

```sql
CREATE TRIGGER log_update
AFTER UPDATE
ON employees
FOR EACH ROW
BEGIN
-- logging logic
END;
```

## Uses

- Audit logs
- Validation
- Notifications
- Data synchronization
