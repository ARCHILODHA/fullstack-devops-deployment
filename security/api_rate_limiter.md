
# API Rate Limiter

## Overview
An API rate limiter controls how many requests a client can make within a specific time period. It protects applications from abuse, excessive traffic, and denial-of-service attempts.

## Common Algorithms
1. Fixed Window: Limits requests within a fixed time interval.
2. Sliding Window: Tracks requests over a moving time interval.
3. Token Bucket: Allows requests using tokens replenished at a fixed rate.
4. Leaky Bucket: Processes requests at a controlled rate.

## Implementation
- Define request limits per user or IP address.
- Track request counts using Redis or an in-memory store.
- Return HTTP 429 when the limit is exceeded.
- Include retry information in response headers.

## Security Best Practices
- Apply stricter limits to authentication endpoints.
- Avoid relying only on IP addresses.
- Monitor repeated violations.
- Configure limits according to application requirements.

## Example Response
HTTP/1.1 429 Too Many Requests
Retry-After: 60

## Benefits
- Prevents API abuse.
- Improves service availability.
- Controls resource consumption.
- Protects backend services from excessive requests.
