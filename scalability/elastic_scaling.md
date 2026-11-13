
# Elastic Scaling

## Overview
Elastic scaling is the ability of an infrastructure or application to automatically increase or decrease resources according to workload demand.

It helps organizations maintain performance while avoiding unnecessary infrastructure expenses.

## Why Elastic Scaling?

- Handles unpredictable traffic.
- Maintains application performance.
- Reduces manual infrastructure management.
- Improves resource utilization.
- Controls infrastructure costs.

## Types of Elastic Scaling

### 1. Scale Out
Adds more application instances when demand increases.

### 2. Scale In
Removes unnecessary instances when demand decreases.

### 3. Scale Up
Increases the CPU, memory, or capacity of existing infrastructure.

### 4. Scale Down
Reduces the resources allocated to existing infrastructure.

## How Elastic Scaling Works

1. Monitoring tools collect resource metrics.
2. Scaling policies evaluate workload conditions.
3. The scaling system identifies resource requirements.
4. New instances are created or unnecessary instances are removed.
5. Load balancers distribute traffic across healthy instances.

## Example: Kubernetes HPA

```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: web-app-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: web-app
  minReplicas: 2
  maxReplicas: 10
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 70
