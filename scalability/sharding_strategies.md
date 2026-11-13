# Database Sharding Strategies

## Overview
Database sharding is a technique that divides a large database into smaller, independent partitions called shards.

Each shard stores a portion of the total data and can operate on separate database servers.

## Why Sharding?

- Handles large datasets.
- Distributes database workload.
- Improves query performance.
- Supports horizontal database scaling.
- Reduces pressure on individual database servers.

## Types of Sharding

### 1. Range-Based Sharding
Data is divided according to a range of values.

Example:
- Shard 1: User IDs 1–1000.
- Shard 2: User IDs 1001–2000.
- Shard 3: User IDs 2001–3000.

### 2. Hash-Based Sharding
A hash function determines which shard stores a record.

```python
def get_shard(user_id, total_shards):
    return hash(user_id) % total_shards

print(get_shard(105, 4))
