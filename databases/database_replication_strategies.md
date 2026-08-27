
# Database Replication Strategies

Database replication creates copies of database data on multiple servers.

Replication improves availability, scalability, and disaster recovery.

## Common Replication Strategies

### 1. Primary-Replica

One primary database handles writes while replicas handle reads.

```text
Application
     |
     v
  Primary
   /    \
  v      v
Replica  Replica
