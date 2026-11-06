# Deployment Rollback Strategy

## Overview
Deployment rollback is the process of reverting an application to a previously stable version when a new release introduces bugs, failures, or performance problems.

It helps maintain application availability and minimize downtime.

## Why Rollback Is Important
- Reduces the impact of failed deployments.
- Restores application stability.
- Minimizes service interruption.
- Protects user experience.
- Supports reliable software releases.

## Common Rollback Strategies

### 1. Previous Version Deployment
- Keep the previous stable application version.
- Deploy it when the current release fails.
- Verify application health after rollback.

### 2. Blue-Green Rollback
- Maintain two production environments.
- Route traffic to the new environment after validation.
- Switch traffic back to the previous environment if problems occur.

### 3. Rolling Deployment Rollback
- Gradually replace application instances.
- Stop the rollout when failures are detected.
- Restore the previous version on affected instances.

### 4. Kubernetes Rollback
Kubernetes supports deployment rollback through rollout history.

Example:

```bash
kubectl rollout history deployment/my-app
kubectl rollout undo deployment/my-app
kubectl rollout status deployment/my-app
