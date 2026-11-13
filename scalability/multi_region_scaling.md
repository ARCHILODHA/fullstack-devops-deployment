
# Multi-Region Scaling

## Overview
Multi-region scaling is the practice of deploying application infrastructure across multiple geographical cloud regions.

It helps applications serve users from different locations while improving availability and reducing geographical latency.

## Why Multi-Region Scaling?

- Supports global user traffic.
- Reduces geographical latency.
- Improves disaster recovery.
- Distributes application workloads.
- Reduces dependence on a single region.

## Multi-Region Architectures

### 1. Active-Passive
One region handles production traffic while another remains available for failover.

### 2. Active-Active
Multiple regions handle production traffic simultaneously.

### 3. Read-Local Architecture
Users read data from a nearby region while writes may be routed to a primary region.

## Architecture

```text
                Global DNS
                    |
             Global Traffic Router
                /          \
               v            v
          Region A       Region B
          Application    Application
               |            |
            Database <--> Database
               Replication
