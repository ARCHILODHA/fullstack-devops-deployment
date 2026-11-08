
# Application Health Checks

## Overview
Application health checks are mechanisms used to determine whether an application or service is operating correctly.

They help deployment systems and orchestration platforms detect unhealthy instances and take corrective actions.

## Types of Health Checks

### 1. Liveness Check
Determines whether an application process is running properly.

If a liveness check repeatedly fails, the platform may restart the container.

### 2. Readiness Check
Determines whether an application is ready to receive traffic.

An application that is not ready should not receive normal service traffic.

### 3. Startup Check
Determines whether an application has completed its startup process.

It is useful for applications that require longer initialization times.

## Kubernetes Health Check Example

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: health-check-app
spec:
  containers:
    - name: web
      image: nginx:stable
      ports:
        - containerPort: 80

      livenessProbe:
        httpGet:
          path: /
          port: 80
        initialDelaySeconds: 10
        periodSeconds: 10

      readinessProbe:
        httpGet:
          path: /
          port: 80
        initialDelaySeconds: 5
        periodSeconds: 5
