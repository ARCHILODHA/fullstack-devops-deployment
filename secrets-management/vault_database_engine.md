# Vault Database Secret Engine

## Overview

Vault generates temporary database users automatically.

Supported Databases

- MySQL
- PostgreSQL
- MSSQL
- Oracle

Workflow

Application
     ↓
Vault
     ↓
Database
     ↓
Temporary User

Benefits

- Automatic credential generation
- Lease expiration
- Better auditing
