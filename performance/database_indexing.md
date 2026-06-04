# Database Indexing

Indexes improve database query performance.

## Benefits
- Faster SELECT queries
- Reduced search time

## Example
```sql
CREATE INDEX idx_user_email
ON users(email);
