
# Load Testing

## Overview
Load testing is a performance testing technique used to evaluate how an application behaves under an expected number of concurrent users or requests.

It helps determine whether an application can handle normal and peak workloads.

## Objectives

- Measure application response time.
- Identify performance bottlenecks.
- Evaluate server capacity.
- Monitor resource utilization.
- Verify scalability.
- Detect failures under expected workloads.

## Types of Load Testing

### 1. Baseline Testing
Measures application performance under normal conditions.

### 2. Peak Load Testing
Evaluates behavior during expected traffic peaks.

### 3. Concurrent User Testing
Checks how the application handles multiple simultaneous users.

### 4. API Load Testing
Measures API performance under repeated requests.

## Popular Tools

- Apache JMeter
- k6
- Gatling
- Locust
- Artillery

## Example: k6 Load Test

Create a file named `load-test.js`.

```javascript
import http from "k6/http";
import { check, sleep } from "k6";

export const options = {
    stages: [
        { duration: "30s", target: 10 },
        { duration: "1m", target: 50 },
        { duration: "30s", target: 0 }
    ]
};

export default function () {
    const response = http.get("https://test.k6.io");

    check(response, {
        "status is 200": (res) => res.status === 200,
        "response time below 1000ms": (res) =>
            res.timings.duration < 1000
    });

    sleep(1);
}
