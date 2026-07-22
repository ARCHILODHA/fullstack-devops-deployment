# Circuit Breaker in Service Mesh

## What is a Circuit Breaker?

A Circuit Breaker is a fault tolerance pattern that prevents repeated requests to unhealthy services.

Instead of continuously sending requests to a failing service, it temporarily blocks traffic until the service recovers.

---

## Why is it Needed?

Without a circuit breaker:

- Requests keep failing.
- Resources are wasted.
- Failure spreads to other services.

With a circuit breaker:

- Stops unnecessary traffic.
- Improves system stability.
- Allows failed services time to recover.

---

## States of Circuit Breaker

### Closed
Normal operation.

### Open
Requests are blocked.

### Half-Open
Limited requests are allowed to test recovery.

---

## Benefits

- Fault tolerance
- Better availability
- Faster recovery
- Reduced cascading failures

---

## Service Mesh Support

- Istio
- Linkerd
- Consul Connect
