
# Database Partitioning

## Overview
Database partitioning is a technique that divides a large database table into smaller logical sections called partitions.

The partitions remain part of the same logical table but allow the database to organize and access data more efficiently.

## Why Database Partitioning?

- Manages large tables.
- Improves query performance for suitable queries.
- Simplifies data archival.
- Improves maintenance operations.
- Supports efficient data management.

## Types of Partitioning

### 1. Range Partitioning
Divides records according to a range of values.

Example: Orders partitioned by order date.

### 2. List Partitioning
Divides records according to predefined values.

Example: Orders partitioned by region.

### 3. Hash Partitioning
Uses a hash function to distribute records across partitions.

### 4. Composite Partitioning
Combines two or more partitioning strategies.

## Example: MySQL Range Partitioning

```sql
CREATE TABLE orders (
    order_id INT NOT NULL,
    order_date DATE NOT NULL,
    amount DECIMAL(10, 2),
    PRIMARY KEY (order_id, order_date)
)
PARTITION BY RANGE (YEAR(order_date)) (
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION p2026 VALUES LESS THAN (2027),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);
