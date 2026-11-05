
# Database Schema Design

## Overview
Database schema design is the process of defining how data is organized, stored, and connected within a database.

A well-designed schema improves data integrity, maintainability, and query performance.

## Main Components

### 1. Tables
Tables store related information in rows and columns.

### 2. Columns
Columns define the attributes of stored records.

### 3. Primary Keys
Primary keys uniquely identify records within a table.

### 4. Foreign Keys
Foreign keys establish relationships between tables.

### 5. Constraints
Constraints enforce rules on stored data.

### 6. Indexes
Indexes help improve data retrieval performance.

## Types of Relationships

### One-to-One
One record in a table is associated with one record in another table.

Example:
- User
- User_Profile

### One-to-Many
One record is associated with multiple records in another table.

Example:
- Customer
- Orders

### Many-to-Many
Multiple records in one table are associated with multiple records in another table.

Example:
- Students
- Courses

A junction table is commonly used to represent this relationship.

## Example Schema

```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);
