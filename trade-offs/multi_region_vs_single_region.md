# Multi-Region vs Single-Region Deployment Trade-off

## Overview
Deploying an application across multiple geographic regions versus a single region involves trade-offs in latency, cost, complexity, and resilience.

## Single-Region Deployment
The entire application stack runs in one geographic region/data center.

**Pros:**
- Simpler architecture — no cross-region data replication or consistency concerns
- Lower cost — no duplicate infrastructure
- Easier debugging and operations

**Cons:**
- Higher latency for users far from the region
- Entire application is vulnerable to a regional outage
- No data residency options for compliance requirements in other geographies

## Multi-Region Deployment
The application is deployed across two or more geographic regions, often with data replication and traffic routing (e.g., via GeoDNS or global load balancers).

**Pros:**
- Lower latency for globally distributed users
- High availability — a regional outage doesn't take down the whole system
- Supports data residency/compliance requirements (e.g., GDPR)

**Cons:**
- Significantly higher cost (duplicated infrastructure, cross-region data transfer)
- Complex data consistency challenges (see CAP theorem trade-offs)
- Increased operational overhead — deployments, monitoring, and failover logic across regions

## Key Design Decisions for Multi-Region
- **Active-Active:** all regions serve live traffic — best availability, hardest consistency
- **Active-Passive:** one region serves traffic, others are standby for failover — simpler, but underutilized capacity
- **Data replication strategy:** synchronous (strong consistency, higher latency) vs asynchronous (lower latency, eventual consistency)

## When to Choose Single-Region
- Early-stage products with a regional user base
- Cost-sensitive projects
- Internal tools without strict uptime SLAs

## When to Choose Multi-Region
- Global user base requiring low latency everywhere
- Mission-critical systems requiring high availability
- Regulatory requirements for data residency

## Conclusion
Single-region deployments are simpler and cheaper but carry availability and latency risks. Multi-region deployments dramatically improve resilience and global performance but at significant cost and complexity — a trade-off best made based on actual business continuity and latency requirements, not by default.
