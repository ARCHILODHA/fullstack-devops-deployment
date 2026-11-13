
# Kubernetes Cluster Scaling

## Overview
Kubernetes cluster scaling is the process of increasing or decreasing the resources available to a Kubernetes environment.

It helps applications handle changing workloads by adjusting worker nodes and application replicas.

## Types of Kubernetes Scaling

### 1. Pod Scaling
Increases or decreases the number of application pods.

### 2. Node Scaling
Adds or removes worker nodes from the cluster.

### 3. Cluster Autoscaling
Automatically adjusts the number of worker nodes according to pending pod requirements and resource utilization.

## Kubernetes Scaling Components

- Horizontal Pod Autoscaler (HPA).
- Vertical Pod Autoscaler (VPA).
- Cluster Autoscaler.
- Metrics Server.
- Kubernetes Scheduler.

## Example: Deployment

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: web-app
  template:
    metadata:
      labels:
        app: web-app
    spec:
      containers:
        - name: web-app
          image: nginx:stable
          resources:
            requests:
              cpu: "100m"
              memory: "128Mi"
            limits:
              cpu: "500m"
              memory: "512Mi"
