# Blackbox Exporter Setup

## Overview
Blackbox Exporter is used by Prometheus to monitor HTTP, HTTPS, TCP, ICMP, and DNS endpoints.

## Installation

```bash
docker run -d \
  --name blackbox-exporter \
  -p 9115:9115 \
  prom/blackbox-exporter
```

## Prometheus Configuration

```yaml
scrape_configs:
  - job_name: blackbox
    metrics_path: /probe
    params:
      module: [http_2xx]
    static_configs:
      - targets:
          - https://example.com
```

## Verification

Visit:

http://localhost:9115

## Benefits

- Website monitoring
- SSL certificate validation
- Endpoint availability
- Network diagnostics
