
# Istio Ambient Mesh Architecture

## 1. Introduction

Istio Ambient Mesh is a service mesh architecture that provides mesh functionality without requiring a sidecar proxy for every application pod.

It offers an alternative to the traditional sidecar-based deployment model.

## 2. What Is Ambient Mesh?

Ambient Mesh separates traffic processing into infrastructure-level components.

It primarily uses:

- ztunnel
- Waypoint proxies

These components provide security and traffic management capabilities for workloads.

## 3. Main Components

### ztunnel

ztunnel is a node-level proxy responsible for core layer 4 functionality.

Responsibilities include:

- Workload identity
- Secure communication
- mTLS
- Basic traffic handling

### Waypoint Proxy

Waypoint proxies provide layer 7 functionality.

Responsibilities include:

- HTTP routing
- Advanced traffic management
- Application-level authorization
- Layer 7 observability

## 4. Architecture Diagram

```text
          Kubernetes Cluster
                  |
        ---------------------
        |                   |
      Node A              Node B
        |                   |
    Application         Application
        |                   |
     ztunnel              ztunnel
        |                   |
        ------ Secure -------
             Communication
                    |
              Waypoint Proxy
