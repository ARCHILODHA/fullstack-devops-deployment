# Stateful vs Stateless Services Trade-off

## Overview
Deciding whether a service holds session/state data locally or externalizes it affects scalability, resilience, and operational complexity.

## Stateless Services
Every request contains all the information needed to process it; the server holds no client-specific data between requests.

**Pros:**
- Easy to scale horizontally — any instance can handle any request
- Simplifies load balancing (no session affinity needed)
- Easier to recover from failures — no state to lose

**Cons:**
- Every request may need to carry more data (e.g., tokens)
- Some workloads (WebSockets, streaming) are inherently harder to make stateless
- Externalized state (DB, cache) adds a network hop

## Stateful Services
The server retains session or connection state between requests (e.g., in-memory sessions, sticky WebSocket connections).

**Pros:**
- Lower latency for stateful operations (no round-trip to external store)
- Natural fit for real-time systems, gaming servers, streaming
- Simpler request payloads

**Cons:**
- Harder to scale — requires session affinity or state replication
- Failure of an instance can lose in-memory state
- Complicates deployments (rolling updates can disrupt active sessions)

## Common Patterns to Bridge the Gap
- **Externalized session store** (Redis, Memcached) to keep services stateless while still supporting sessions
- **Sticky sessions** at the load balancer for stateful services
- **State replication** across instances for fault tolerance

## When to Choose Stateless
- REST APIs, microservices, serverless functions
- Systems requiring elastic auto-scaling

## When to Choose Stateful
- Real-time multiplayer games
- Long-lived WebSocket/streaming connections
- Systems where state size makes externalizing it impractical

## Conclusion
Stateless design is generally preferred for scalability and resilience in cloud-native systems, but certain real-time and connection-oriented workloads benefit from stateful design despite the added scaling complexity.
