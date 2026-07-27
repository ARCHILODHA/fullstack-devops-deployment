# Circuit Breaker Pattern

## Overview
Circuit Breaker prevents repeated failures by stopping requests to unhealthy services.

## States
1. Closed
2. Open
3. Half Open

## Advantages
- Prevents cascading failures
- Improves reliability
- Faster recovery

## Disadvantages
- Configuration complexity

## Popular Tools
- Resilience4j
- Hystrix
