
# Database Transaction Isolation Levels

## Overview
Transaction isolation defines how concurrent database transactions interact with one another.

It controls the visibility of changes made by transactions and helps maintain data consistency.

## Common Concurrency Problems

### 1. Dirty Read
A transaction reads data modified by another transaction that has not yet committed.

### 2. Non-Repeatable Read
A transaction reads the same row twice and receives different values because another transaction committed an update.

### 3. Phantom Read
A transaction executes the same range query twice and finds additional or missing rows because another transaction inserted or deleted matching records.

## Isolation Levels

### 1. Read Uncommitted
- Lowest standard isolation level.
- Transactions may read uncommitted changes.
- Dirty reads are possible.

### 2. Read Committed
- Transactions read only committed data.
- Dirty reads are prevented.
- Non-repeatable reads may occur.

### 3. Repeatable Read
- Repeated reads of the same rows are protected according to the database's isolation implementation.
- Phantom behavior depends on the database engine and implementation.

### 4. Serializable
- Highest standard isolation level.
- Transactions behave as if executed in a serial order.
- Can reduce concurrency and increase blocking.

## Comparison

| Isolation Level | Dirty Read | Non-Repeatable Read | Phantom Read |
|---|---|---|---|
| Read Uncommitted | Possible | Possible | Possible |
| Read Committed | Prevented | Possible | Possible |
| Repeatable Read | Prevented | Prevented | Depends on implementation |
| Serializable | Prevented | Prevented | Prevented |

## Example SQL

```sql
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

START TRANSACTION;

SELECT *
FROM accounts
WHERE account_id = 101;

COMMIT;
