
# Read Replicas

## Overview
Read replicas are copies of a primary database that handle read operations.

They reduce the workload on the primary database by distributing read queries across multiple replicas.

## Why Read Replicas?

- Reduce primary database load.
- Improve read scalability.
- Support read-heavy applications.
- Distribute database traffic.
- Improve geographical data access.

## How Read Replicas Work

1. The application writes data to the primary database.
2. The primary database records the changes.
3. Changes are replicated to read replicas.
4. Read requests are routed to available replicas.
5. Write requests continue to use the primary database.

## Architecture

```text
              Application
                   |
             Database Router
              /          \
             v            v
        Write Queries  Read Queries
             |            |
             v            v
        Primary DB ----> Replica 1
                    \--> Replica 2
