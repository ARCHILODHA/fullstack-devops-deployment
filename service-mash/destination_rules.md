
# Istio Destination Rules

## 1. Introduction

DestinationRule is an Istio networking resource that defines policies applied to traffic after routing decisions have been made.

It controls how traffic is handled when it reaches a destination service.

## 2. What Is a DestinationRule?

A DestinationRule defines destination-specific traffic policies.

It supports:

- Service subsets
- Load balancing
- Connection pooling
- Outlier detection
- TLS configuration
- Traffic policies

## 3. Basic DestinationRule

Example:

```yaml
apiVersion: networking.istio.io/v1
kind: DestinationRule
metadata:
  name: application-rule
spec:
  host: application
  trafficPolicy:
    loadBalancer:
      simple: ROUND_ROBIN
