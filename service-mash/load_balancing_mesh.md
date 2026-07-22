# Load Balancing in Service Mesh

## Introduction

Load balancing distributes incoming requests across multiple service instances.

---

## Types

### Round Robin

Requests are distributed one after another.

### Least Connections

Traffic goes to the least busy server.

### Random

Requests go to random instances.

---

## Benefits

- High availability
- Better performance
- Prevents server overload

---

## Popular Implementations

- Envoy
- Istio
