
# Reliability Testing

## Overview
Reliability testing evaluates whether an application can operate consistently over time under expected operating conditions.

It helps identify failures, instability, resource leaks, and weaknesses in recovery mechanisms.

## Objectives

- Evaluate system stability.
- Identify recurring failures.
- Verify recovery mechanisms.
- Detect resource leaks.
- Validate service availability.
- Improve operational confidence.

## Types of Reliability Testing

### 1. Soak Testing
Runs an application under sustained load for an extended period to identify memory leaks and gradual degradation.

### 2. Failover Testing
Checks whether a backup component can take over when the primary component fails.

### 3. Recovery Testing
Verifies that a system can return to normal operation after a failure.

### 4. Chaos Testing
Introduces controlled failures to evaluate system resilience.

### 5. Endurance Testing
Evaluates system behavior during prolonged operation.

## Example: Basic Reliability Check with k6

```javascript
import http from "k6/http";
import { check, sleep } from "k6";

export const options = {
    vus: 10,
    duration: "5m",
    thresholds: {
        http_req_failed: ["rate<0.01"],
        http_req_duration: ["p(95)<500"]
    }
};

export default function () {
    const response = http.get("https://test.k6.io");

    check(response, {
        "status is successful": (res) =>
            res.status >= 200 && res.status < 400
    });

    sleep(1);
}
