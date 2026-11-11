
# Database Connection Pooling

## Overview
Database connection pooling is a technique that maintains a reusable collection of database connections.

Instead of creating a new connection for every request, applications reuse existing connections from the pool.

## Why Connection Pooling?

Creating database connections repeatedly can cause:

- Increased connection overhead.
- Higher database resource consumption.
- Slower request processing.
- Connection exhaustion.
- Reduced application throughput.

## How It Works

1. The application creates a connection pool.
2. A request asks the pool for a connection.
3. An available connection is assigned.
4. The application executes database operations.
5. The connection is returned to the pool.
6. Another request can reuse it.

## Important Configuration Parameters

| Parameter | Description |
|---|---|
| Minimum Pool Size | Minimum maintained connections |
| Maximum Pool Size | Maximum allowed connections |
| Connection Timeout | Maximum time to wait for a connection |
| Idle Timeout | Time before an unused connection is removed |
| Max Lifetime | Maximum lifetime of a connection |

## Example: HikariCP Configuration

For a Spring Boot application:

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/studentdb
    username: ${DB_USERNAME}
    password: ${DB_PASSWORD}
    hikari:
      maximum-pool-size: 10
      minimum-idle: 2
      connection-timeout: 30000
      idle-timeout: 600000
      max-lifetime: 1800000
