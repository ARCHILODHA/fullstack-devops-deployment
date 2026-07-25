# Caching Strategies Trade-off

## Overview
Caching improves performance by storing frequently accessed data closer to the consumer, but different caching strategies come with different consistency and complexity trade-offs.

## Cache-Aside (Lazy Loading)
Application checks cache first; on a miss, it loads from the database and populates the cache.

**Pros:** Only requested data is cached; simple to implement
**Cons:** First request after a miss is slow (cache miss penalty); risk of stale data

## Write-Through
Data is written to the cache and database simultaneously.

**Pros:** Cache is always consistent with the database
**Cons:** Higher write latency; unused data still gets cached

## Write-Behind (Write-Back)
Data is written to the cache first and asynchronously flushed to the database.

**Pros:** Very fast writes
**Cons:** Risk of data loss if the cache fails before flushing; added complexity

## Read-Through
The cache itself is responsible for loading data from the database on a miss (abstracted from the application).

**Pros:** Simplifies application logic
**Cons:** Requires cache provider support; less control over loading logic

## Eviction Policies
- **LRU (Least Recently Used):** evicts the oldest unused entries — good general-purpose default
- **LFU (Least Frequently Used):** evicts rarely accessed entries — better for skewed access patterns
- **TTL (Time-to-Live):** entries expire after a fixed duration — good for time-sensitive data

## Trade-offs Summary
| Strategy | Write Speed | Consistency | Complexity |
|---|---|---|---|
| Cache-Aside | Fast | Eventual | Low |
| Write-Through | Slower | Strong | Medium |
| Write-Behind | Fastest | Weak | High |

## Conclusion
There is no universally "best" caching strategy — cache-aside is a safe default for read-heavy workloads, write-through suits systems needing strong consistency, and write-behind suits write-heavy systems that can tolerate some risk of data loss.
