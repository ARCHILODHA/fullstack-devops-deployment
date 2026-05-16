# Circuit Breaker Pattern

The Circuit Breaker pattern prevents repeated failures in distributed systems.

## States

1. Closed
2. Open
3. Half-Open

## Benefits

- Prevents cascading failures
- Improves reliability
- Reduces server overload

## Real Example

Netflix Hystrix uses circuit breakers.

## Workflow

Client → Circuit Breaker → Service

If failures exceed threshold:
- Circuit opens
- Requests fail fast
