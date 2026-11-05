# Database Query Execution Plan

## Overview
A database query execution plan describes how a database engine executes an SQL query.

It shows the operations selected by the query optimizer to retrieve or modify data.

## Why Execution Plans Matter

- Identify slow queries.
- Understand table access methods.
- Detect missing indexes.
- Analyze join operations.
- Improve query performance.

## Main Components

### 1. Table Scan
The database examines rows in a table to find matching records.

### 2. Index Scan
The database uses an index to locate relevant records.

### 3. Join Operations
Execution plans show how tables are combined.

Common join strategies include:
- Nested Loop Join
- Hash Join
- Merge Join

### 4. Sorting
The database may sort records to satisfy ORDER BY or other operations.

### 5. Filtering
Conditions are applied to reduce the number of returned rows.

## Example SQL Query

```sql
SELECT *
FROM employees
WHERE department_id = 10;
