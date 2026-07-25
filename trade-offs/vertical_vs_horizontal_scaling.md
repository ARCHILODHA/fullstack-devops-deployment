# Vertical vs Horizontal Scaling Trade-off

## Overview
Scaling a system to handle increased load can be done by adding more resources to a single machine (vertical) or adding more machines (horizontal).

## Vertical Scaling (Scale Up)
Increasing the CPU, RAM, or storage of an existing server.

**Pros:**
- Simple — no architectural changes required
- No need for distributed system complexity (no data partitioning, no coordination)
- Lower latency for operations that need shared memory/state

**Cons:**
- Hard physical/cost limits — you eventually hit a ceiling
- Single point of failure — one machine going down takes everything with it
- Downtime often required to resize (except with some cloud live-resize features)

## Horizontal Scaling (Scale Out)
Adding more machines/instances and distributing load across them.

**Pros:**
- Near-limitless scalability by adding more nodes
- Improved fault tolerance — failure of one node doesn't take down the system
- Enables geographic distribution for lower latency

**Cons:**
- Requires load balancing and often data partitioning/sharding
- Increased operational complexity (service discovery, coordination, consistency)
- Network overhead between nodes

## Cost Comparison
- Vertical scaling costs grow non-linearly at the high end (premium hardware is disproportionately expensive)
- Horizontal scaling costs grow more linearly but add infrastructure overhead (load balancers, orchestration)

## When to Choose Vertical
- Early-stage applications with limited traffic
- Monolithic systems not yet ready for distribution
- Workloads requiring strong consistency and low-latency shared state

## When to Choose Horizontal
- High-traffic, high-availability production systems
- Cloud-native and microservices architectures
- Systems needing fault tolerance and geographic distribution

## Conclusion
Vertical scaling is simpler and works well up to a point, but horizontal scaling is essential for systems that need to handle large-scale, fault-tolerant, and globally distributed workloads. Most mature systems eventually adopt a hybrid: vertically-sized nodes scaled out horizontally.
