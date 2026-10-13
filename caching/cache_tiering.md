Cache Tiering

Cache tiering uses multiple cache levels to balance access speed, storage capacity, and cost.

Different cache levels can provide different performance characteristics.

Architecture
Client Request
      |
      v
L1: Local Memory Cache
      |
      | Cache Miss
      v
L2: Distributed Cache
      |
      | Cache Miss
      v
Database

The application checks the fastest cache first and moves to slower layers when the requested data is unavailable.

L1 Cache

The first-level cache is usually local application memory.

Characteristics:

Very low latency.
Limited capacity.
Often instance-specific.
Requires consideration of stale data across instances.
L2 Cache

The second-level cache is commonly a distributed system such as Redis.

Characteristics:

Shared across application instances.
Larger capacity than a typical local cache.
Requires network communication.
Can reduce database traffic.
Database

The database acts as the underlying source of truth for the application's data.

If an item is absent from both cache layers, the application retrieves it from the database and may populate the caches.

Example

An online store can use:

L1: Product information in application memory
L2: Product information in Redis
L3: Product information in MySQL

Frequently accessed products may be served from L1. Less frequently accessed products may be served from Redis.

Challenges
Keeping multiple cache layers consistent.
Managing invalidation across application instances.
Preventing stale values from persisting too long.
Avoiding unnecessary complexity.
Monitoring memory usage and hit rates.
Best Practices
Define clear TTL policies for each layer.
Establish an invalidation strategy.
Measure the latency and hit rate of each cache.
Use local caching selectively.
Ensure cache failures do not cause uncontrolled database traffic.
Conclusion

Cache tiering can improve performance and reduce infrastructure costs when the benefits justify the added complexity.
