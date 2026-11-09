
# Prometheus Federation

## Overview
Prometheus federation allows one Prometheus server to retrieve selected time series from another Prometheus server.

It is useful when monitoring large infrastructures across multiple environments, clusters, or regions.

## Why Federation?

- Centralize selected metrics.
- Monitor multiple Prometheus servers.
- Support multi-cluster monitoring.
- Reduce the need to query every server individually.
- Build global infrastructure dashboards.

## Architecture

1. Local Prometheus servers collect application and infrastructure metrics.
2. A central Prometheus server retrieves selected metrics.
3. The central server stores federated time series.
4. Grafana visualizes centralized monitoring data.

## Example Configuration

Configure the central Prometheus server:

```yaml
scrape_configs:
  - job_name: "federate"
    scrape_interval: 30s
    honor_labels: true

    metrics_path: "/federate"

    params:
      match[]:
        - '{job="node-exporter"}'
        - '{__name__=~"job:.*"}'

    static_configs:
      - targets:
          - "prometheus-region-1:9090"
          - "prometheus-region-2:9090"
