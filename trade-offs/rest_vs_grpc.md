# REST vs gRPC Trade-off

## Overview
REST and gRPC are two popular approaches for service-to-service and client-server communication, each with different performance and usability characteristics.

## REST (Representational State Transfer)
Uses HTTP/1.1 with JSON payloads and standard verbs (GET, POST, PUT, DELETE).

**Pros:**
- Human-readable, easy to debug with standard tools (curl, browser)
- Broad compatibility — works with virtually every client and platform
- Simple caching via standard HTTP semantics
- Large ecosystem, easy onboarding for new developers

**Cons:**
- JSON parsing overhead compared to binary formats
- No built-in strict contract — relies on documentation (OpenAPI) for schema enforcement
- Less efficient for high-throughput, low-latency internal service communication

## gRPC
Uses HTTP/2 with Protocol Buffers (binary serialization) and supports strongly-typed contracts via `.proto` files.

**Pros:**
- Much faster serialization/deserialization than JSON
- Strongly typed contracts catch errors at compile time
- Supports streaming (client, server, and bidirectional)
- Multiplexed requests over a single HTTP/2 connection

**Cons:**
- Not human-readable — harder to debug without tooling
- Limited browser support without a proxy (gRPC-Web)
- Steeper learning curve; requires protobuf tooling and code generation

## Performance Comparison
| Aspect | REST | gRPC |
|---|---|---|
| Payload size | Larger (text-based JSON) | Smaller (binary) |
| Speed | Slower | Faster |
| Streaming | Limited (polling/SSE) | Native support |
| Browser support | Native | Requires proxy |

## When to Choose REST
- Public-facing APIs consumed by third parties
- Simplicity and debuggability are priorities
- Browser-based clients

## When to Choose gRPC
- Internal microservice-to-microservice communication
- Performance-critical, high-throughput systems
- Need for strict API contracts and streaming

## Conclusion
REST remains the standard for public APIs due to simplicity and universal compatibility, while gRPC excels in internal, performance-sensitive service communication where strong typing and speed matter more than human readability.
