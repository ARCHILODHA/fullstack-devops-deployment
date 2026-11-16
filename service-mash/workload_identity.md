
# Workload Identity in Service Mesh

## 1. Introduction

Workload Identity is a mechanism used to identify applications, containers, and services running in distributed environments.

In a service mesh, workload identity helps establish trust between communicating services without depending on manually configured credentials.

## 2. What Is Workload Identity?

A workload identity uniquely identifies a running application or service.

It can be associated with:

- Kubernetes service accounts
- Workload certificates
- Service identities
- Namespace information
- Trust domains

## 3. Why Workload Identity Is Important

Traditional applications often use static credentials for service authentication.

These credentials can be difficult to rotate and may become security risks if exposed.

Workload identity provides a more manageable approach to authentication.

## 4. Workload Identity in Istio

Istio commonly uses service accounts to establish workload identities.

Example Kubernetes ServiceAccount:

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: payment-service
  namespace: production
