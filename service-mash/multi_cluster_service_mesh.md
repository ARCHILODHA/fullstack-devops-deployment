
# Multi-Cluster Service Mesh

## 1. Introduction

A Multi-Cluster Service Mesh connects workloads running across multiple Kubernetes clusters.

Organizations use multiple clusters for high availability, geographical distribution, isolation, and disaster recovery.

A multi-cluster mesh enables services in different clusters to communicate using consistent networking and security policies.

## 2. What Is Multi-Cluster Service Mesh?

A multi-cluster service mesh extends service mesh capabilities across multiple Kubernetes clusters.

It provides:

- Cross-cluster service discovery
- Secure service communication
- Traffic routing
- Load balancing
- Centralized observability

## 3. Architecture

```text
             Service Mesh
                   |
        -----------------------
        |                     |
   Cluster A              Cluster B
        |                     |
   Frontend Service      Backend Service
        |                     |
     Proxy A  <----------> Proxy B
