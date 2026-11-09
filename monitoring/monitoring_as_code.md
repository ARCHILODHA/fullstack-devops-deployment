
# Monitoring as Code

## Overview
Monitoring as Code is the practice of managing monitoring configurations through version-controlled files and automated deployment pipelines.

It applies Infrastructure as Code principles to monitoring resources.

## Components

- Prometheus configuration.
- Alerting rules.
- Grafana dashboards.
- Exporter configuration.
- Monitoring agents.
- Deployment automation.

## Why Monitoring as Code?

- Reproducible monitoring environments.
- Version-controlled configurations.
- Easier code reviews.
- Consistent deployment.
- Faster recovery from configuration errors.

## Example: Prometheus Configuration

```yaml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: "prometheus"
    static_configs:
      - targets: ["localhost:9090"]

  - job_name: "node-exporter"
    static_configs:
      - targets: ["node-exporter:9100"]
