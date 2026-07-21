# Database Design

## Overview
The application uses a relational database to store application data.

## Tables

### Users
| Column | Type | Description |
|---------|------|-------------|
| id | INT | Primary Key |
| username | VARCHAR(100) | Unique Username |
| email | VARCHAR(150) | Email Address |
| password | VARCHAR(255) | Encrypted Password |

### Products
| Column | Type | Description |
|---------|------|-------------|
| id | INT | Primary Key |
| name | VARCHAR(150) | Product Name |
| price | DECIMAL | Product Price |

## Relationships

- One User can create multiple Products.
- Foreign Keys maintain data integrity.

## Best Practices

- Normalize tables.
- Use indexes on searchable columns.
- Backup database regularly.
