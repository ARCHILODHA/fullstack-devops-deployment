# Rate Limiting

## Overview
Rate limiting is a technique used to control the number of requests a client can make to a service within a specific time period.

It protects applications from excessive traffic, accidental overload, and certain types of abuse.

## Why Rate Limiting?

- Prevents API abuse.
- Protects backend resources.
- Controls traffic spikes.
- Improves service stability.
- Helps maintain fair resource usage.

## Common Rate Limiting Algorithms

### 1. Fixed Window Counter
Allows a predefined number of requests during a fixed time window.

### 2. Sliding Window Log
Tracks request timestamps and removes requests outside the allowed time window.

### 3. Sliding Window Counter
Combines fixed windows with weighted request counts.

### 4. Token Bucket
Tokens are added at a fixed rate. Each request consumes a token.

### 5. Leaky Bucket
Requests are processed at a controlled rate through a queue.

## Example: Express Rate Limiting

Install the package:

```bash
npm install express express-rate-limit
