
# Autoscaling Policies

## Overview
Autoscaling policies define the conditions under which infrastructure automatically increases or decreases its resources.

They help applications respond to workload changes without requiring manual intervention.

## Types of Autoscaling Policies

### 1. Target Tracking
Maintains a selected metric near a target value.

Example: Maintain average CPU utilization around 60%.

### 2. Step Scaling
Changes capacity by different amounts depending on how far a metric moves beyond a threshold.

### 3. Simple Scaling
Adds or removes capacity based on a single alarm and adjustment.

### 4. Scheduled Scaling
Changes capacity according to a predefined schedule.

### 5. Predictive Scaling
Uses historical workload patterns to forecast future capacity requirements.

## Example: AWS Auto Scaling Policy

```json
{
  "TargetValue": 60.0,
  "PredefinedMetricSpecification": {
    "PredefinedMetricType": "ASGAverageCPUUtilization"
  },
  "ScaleOutCooldown": 60,
  "ScaleInCooldown": 300
}
