
# Database Data Archiving

## Overview
Database archiving is the process of moving older or less frequently accessed data from active database tables to separate storage.

It helps maintain database performance and control storage growth.

## Why Data Archiving Is Important

- Reduces active database size.
- Improves query performance in some workloads.
- Controls storage expenses.
- Supports long-term data retention.
- Simplifies management of historical records.

## Types of Data Archiving

### 1. Historical Data Archiving
Moves old records to separate archive tables or storage systems.

### 2. Cloud-Based Archiving
Stores historical data in cloud storage services such as Amazon S3.

### 3. Database Archive Tables
Moves older records into dedicated database tables.

### 4. Cold Storage Archiving
Stores rarely accessed data in lower-cost storage classes.

## Example

Suppose an e-commerce application stores customer orders.

Active table:
- Recent orders
- Pending orders
- Frequently accessed orders

Archive storage:
- Completed orders older than a defined period
- Historical reports
- Old transaction records

## Example SQL

```sql
CREATE TABLE archived_orders LIKE orders;

INSERT INTO archived_orders
SELECT *
FROM orders
WHERE order_date < '2024-01-01';
