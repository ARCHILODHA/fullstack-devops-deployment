# AWS Compute Optimizer

## Overview

AWS Compute Optimizer recommends optimal AWS resources based on historical utilization metrics.

## Supported Resources

- EC2 Instances
- Auto Scaling Groups
- Lambda Functions
- EBS Volumes

## Benefits

- Reduce infrastructure costs
- Improve performance
- Detect over-provisioned resources
- Detect under-utilized resources

## How It Works

1. Collect CloudWatch metrics
2. Analyze resource utilization
3. Generate recommendations
4. Apply recommended instance types

## Best Practices

- Review recommendations regularly.
- Enable CloudWatch detailed monitoring.
- Combine with AWS Trusted Advisor.

## Example

Instead of:

t3.large (10% CPU)

Recommendation:

t3.small

Savings:
Approximately 50-60%
