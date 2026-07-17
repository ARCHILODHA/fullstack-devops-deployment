# Database Index Types

## What is an Index?

A database index is a data structure that improves the speed of data retrieval.

## Types

### 1. Primary Index
- Created automatically on primary key
- Unique

### 2. Secondary Index
- Created on non-primary columns
- Improves searching

### 3. Composite Index
- Uses multiple columns

Example:
(first_name, last_name)

### 4. Clustered Index
- Physically sorts table data
- Only one per table

### 5. Non-Clustered Index
- Separate structure
- Multiple allowed

## Advantages
- Faster SELECT queries
- Efficient sorting
- Better filtering

## Disadvantages
- Extra storage
- Slower INSERT/UPDATE/DELETE
