
# Istio Gateway Configuration

## 1. Introduction

Istio Gateway configuration controls how incoming and outgoing traffic enters or leaves the service mesh.

Gateways operate at the edge of the mesh and allow administrators to configure traffic exposure, TLS settings, and routing.

## 2. What Is an Istio Gateway?

An Istio Gateway is a Kubernetes resource that configures traffic handling for a gateway proxy.

It defines:
- Ports
- Protocols
- Hostnames
- TLS settings
- Traffic exposure rules

A Gateway resource does not define complete application routing by itself. It is commonly combined with VirtualService resources.

## 3. Gateway Architecture

```text
External Client
      |
      v
Istio Ingress Gateway
      |
      v
VirtualService
      |
      v
Kubernetes Service
      |
      v
Application Pods
