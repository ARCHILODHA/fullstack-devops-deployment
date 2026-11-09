
# SLI, SLO, and SLA in Monitoring

## Overview
SLI, SLO, and SLA are important reliability concepts used to measure and manage service performance.

They help teams define what reliable service means and determine whether user expectations are being met.

## 1. Service Level Indicator (SLI)

An SLI is a measurable indicator of service reliability.

Examples:

- Availability percentage.
- Request success rate.
- Response latency.
- Error rate.
- Data processing time.

## 2. Service Level Objective (SLO)

An SLO is a target value for an SLI over a defined period.

Example:

A service may define an availability SLO of 99.9% over a rolling 30-day period.

## 3. Service Level Agreement (SLA)

An SLA is a formal agreement between a service provider and customer.

It may define:

- Availability commitments.
- Support response times.
- Service credits.
- Responsibilities.
- Consequences of failing to meet commitments.

## Example

| Concept | Example |
|---|---|
| SLI | Successful HTTP requests |
| SLO | 99.9% successful requests |
| SLA | Contractual availability commitment |

## Monitoring SLOs

Useful Prometheus metrics include:

```promql
sum(rate(http_requests_total{status!~"5.."}[5m]))
/
sum(rate(http_requests_total[5m]))
