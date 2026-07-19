# Rightsizing AWS Resources

## What is Rightsizing?

Selecting the correct resource size based on workload.

## Why It Matters

Over-sized resources increase costs.

Under-sized resources reduce performance.

## Examples

EC2

Current:
m5.large

Recommended:
t3.medium

RDS

Current:
db.r5.large

Recommended:
db.t3.medium

## Best Practices

- Monitor CPU utilization.
- Monitor memory usage.
- Review network traffic.
- Resize periodically.
