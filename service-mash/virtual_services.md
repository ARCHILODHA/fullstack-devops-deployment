
# Istio Virtual Services

## 1. Introduction

VirtualService is an Istio networking resource used to control how requests are routed to services inside a service mesh.

It provides flexible traffic routing without requiring changes to application code.

## 2. What Is a VirtualService?

A VirtualService defines routing rules for traffic matching specific conditions.

It supports:

- Host-based routing
- URI-based routing
- Header-based routing
- Traffic splitting
- Redirects
- Retries
- Timeouts
- Fault injection

## 3. Basic VirtualService Configuration

Example:

```yaml
apiVersion: networking.istio.io/v1
kind: VirtualService
metadata:
  name: application-route
spec:
  hosts:
  - application
  http:
  - route:
    - destination:
        host: application
        port:
          number: 8080
