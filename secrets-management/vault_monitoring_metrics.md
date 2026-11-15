
# Vault Monitoring and Metrics

## 1. Introduction

Monitoring Vault helps administrators understand system health, performance, availability, and security-related activity.

Vault exposes operational metrics that can be collected by monitoring platforms.

## 2. Why Monitor Vault?

Monitoring helps identify:

- High request latency
- Authentication failures
- Increased API errors
- Resource consumption
- Seal status changes
- Performance problems

## 3. Vault Telemetry

Vault provides telemetry metrics that can be exposed for monitoring.

A simplified configuration example:

```hcl
telemetry {
  prometheus_retention_time = "30s"
  disable_hostname = true
}
