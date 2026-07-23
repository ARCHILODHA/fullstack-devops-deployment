# Health Checks

## Overview

Health checks determine whether an application is functioning correctly.

## Types

- Liveness Probe
- Readiness Probe
- Startup Probe

## Kubernetes Example

```yaml
livenessProbe:
  httpGet:
    path: /health
    port: 8080
```

## Best Practices

- Keep endpoints lightweight.
- Return proper HTTP status codes.
- Monitor response times.
