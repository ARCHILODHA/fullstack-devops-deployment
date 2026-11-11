
# Stress Testing

## Overview
Stress testing evaluates how an application behaves when pushed beyond its normal operating capacity.

Its purpose is to identify the breaking point of a system and understand how it behaves under extreme conditions.

## Objectives

- Find the maximum system capacity.
- Identify failure conditions.
- Evaluate resource limits.
- Test recovery behavior.
- Detect bottlenecks.
- Verify graceful degradation.

## How Stress Testing Works

1. Establish a normal performance baseline.
2. Gradually increase traffic or workload.
3. Monitor application and infrastructure metrics.
4. Identify the point where performance degrades.
5. Observe system failure behavior.
6. Reduce the load and evaluate recovery.

## Example: k6 Stress Test

```javascript
import http from "k6/http";

export const options = {
    stages: [
        { duration: "1m", target: 50 },
        { duration: "2m", target: 100 },
        { duration: "2m", target: 200 },
        { duration: "1m", target: 0 }
    ]
};

export default function () {
    http.get("https://test.k6.io");
}
