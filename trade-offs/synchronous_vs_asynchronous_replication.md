# Synchronous vs Asynchronous Replication

## 1. Introduction

Database replication maintains copies of data across multiple database nodes.

Two common approaches are synchronous and asynchronous replication.

Choosing between them affects data durability, consistency, write latency, and availability.

## 2. What Is Synchronous Replication?

In synchronous replication, a write operation waits for acknowledgement from the required replica or replicas before being confirmed.

This helps ensure that replicated data is available according to the configured acknowledgement policy.

### Working Process

1. Client sends a write request.
2. Primary database processes the update.
3. Data is sent to synchronous replicas.
4. Required replicas acknowledge the update.
5. Primary confirms the transaction.

## 3. What Is Asynchronous Replication?

In asynchronous replication, the primary database confirms a write without waiting for all replicas to acknowledge it.

Replicas receive the update later.

### Working Process

1. Client sends a write request.
2. Primary database processes the update.
3. Primary confirms the transaction.
4. Replication occurs in the background.
5. Replicas eventually receive the update.

## 4. Comparison

| Factor | Synchronous | Asynchronous |
|---|---|---|
| Write latency | Usually higher | Usually lower |
| Data replication | Waits for required acknowledgement | Happens later |
| Data loss risk | Lower within configured guarantees | Possible during failover |
| Availability | May be affected by replica failure | Often more flexible |
| Network dependency | Higher | Lower |
| Common use | Critical database workloads | Read scaling and remote replicas |

## 5. Practical Example

### Banking System

A banking system may use synchronous replication for critical financial records to reduce the risk of losing acknowledged transactions.

### Content Platform

A content platform may use asynchronous replication for read replicas because a small replication delay may be acceptable.

## 6. Architecture

```text
Synchronous:

Client
  |
  v
Primary Database
  |
  +------> Replica 1
  |
  +------> Replica 2
  |
Wait for required acknowledgements
  |
  v
Confirm Write


Asynchronous:

Client
  |
  v
Primary Database
  |
  +------> Background Replication
  |                |
Confirm Write      v
               Replicas
