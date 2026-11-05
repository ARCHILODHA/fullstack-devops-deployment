# Database Monitoring Metrics

## Overview
Database monitoring is the continuous observation of database performance, availability, resource utilization, and operational health.

It helps identify performance problems before they affect applications.

## Important Database Metrics

### 1. CPU Utilization
Measures how much processor capacity the database uses.

High CPU utilization may indicate:
- Expensive queries.
- High request volume.
- Inefficient indexing.
- Insufficient compute capacity.

### 2. Memory Utilization
Measures memory consumption by the database.

Insufficient memory can increase disk access and reduce performance.

### 3. Query Latency
Measures the time required to execute database queries.

High latency can affect application response times.

### 4. Active Connections
Tracks the number of currently active database connections.

Excessive connections can overload database resources.

### 5. Disk I/O
Measures database read and write activity.

High disk latency can slow database operations.

### 6. Replication Lag
Measures the delay between changes on a primary database and their application on replicas.

### 7. Storage Utilization
Tracks database storage consumption and available capacity.

## Monitoring Tools

- Amazon CloudWatch
- Amazon RDS Performance Insights
- Prometheus
- Grafana
- MySQL Performance Schema
- PostgreSQL Statistics Views

## Example MySQL Monitoring Queries

### Check Active Connections

```sql
SHOW STATUS LIKE 'Threads_connected';
