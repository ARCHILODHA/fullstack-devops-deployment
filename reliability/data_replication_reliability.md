
# Data Replication and Reliability

## Overview
Data replication is the process of maintaining copies of data across multiple servers or locations.

It improves data availability, supports disaster recovery, and can increase read scalability.

## Why Data Replication?

- Protects against hardware failures.
- Improves data availability.
- Supports disaster recovery.
- Enables geographical distribution.
- Reduces read workload on primary databases.

## Types of Replication

### 1. Synchronous Replication
A write is acknowledged after the required replicas confirm the operation.

It can provide stronger durability guarantees but may increase write latency.

### 2. Asynchronous Replication
The primary database acknowledges a write before all replicas receive it.

It can reduce write latency but may result in data loss during certain failures.

### 3. Semi-Synchronous Replication
The primary waits for acknowledgment from at least one replica before confirming the write, depending on the database implementation.

## Replication Architecture

```text
             Application
                  |
                  v
             Primary DB
              /      \
             v        v
        Replica 1  Replica 2
             |        |
             v        v
          Read     Read
          Queries  Queries
