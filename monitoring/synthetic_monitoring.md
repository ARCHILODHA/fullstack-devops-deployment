
# Synthetic Monitoring

## Overview
Synthetic monitoring uses automated tests to simulate user interactions with an application or service.

It checks availability and performance without waiting for actual users to report problems.

## How It Works

1. Define important application journeys.
2. Configure automated monitoring checks.
3. Execute checks from selected locations.
4. Record response time and availability.
5. Generate alerts when checks fail.

## Types of Synthetic Monitoring

### 1. Availability Checks
Verify whether an application or endpoint is reachable.

### 2. API Monitoring
Test API endpoints and validate HTTP responses.

### 3. Browser Monitoring
Simulate user actions such as login and navigation.

### 4. Transaction Monitoring
Test complete business workflows.

## Example: Prometheus Blackbox Exporter

```yaml
modules:
  http_2xx:
    prober: http
    timeout: 5s
    http:
      valid_status_codes: [200]
      method: GET
