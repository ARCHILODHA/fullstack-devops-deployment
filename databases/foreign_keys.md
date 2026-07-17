# Foreign Keys

## Definition

A foreign key creates a relationship between two tables.

Example

Customers

- customer_id

Orders

- order_id
- customer_id

## Benefits

- Maintains referential integrity
- Prevents invalid records
- Supports joins

Example

```sql
FOREIGN KEY(customer_id)
REFERENCES Customers(customer_id);
```
