
# Prometheus Recording Rules

## Overview
Prometheus recording rules allow frequently used or computationally expensive PromQL expressions to be evaluated periodically and stored as new time series.

They improve query performance and simplify dashboards.

## Why Recording Rules?

- Reduce repeated query calculations.
- Improve dashboard performance.
- Reuse common expressions.
- Simplify complex PromQL queries.
- Support efficient alerting rules.

## Configuration

Create a file named `recording_rules.yml`.

```yaml
groups:
  - name: application-recording-rules
    interval: 30s
    rules:
      - record: job:http_requests:rate5m
        expr: sum by (job) (rate(http_requests_total[5m]))

      - record: job:http_errors:rate5m
        expr: sum by (job) (rate(http_requests_total{status=~"5.."}[5m]))
