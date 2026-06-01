# Monitoring Architecture

## Components

1. Prometheus
2. Grafana
3. Node Exporter
4. Alertmanager

## Workflow

Applications -> Exporters -> Prometheus -> Grafana
                                     |
                                     v
                              Alertmanager
