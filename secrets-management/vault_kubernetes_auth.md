# Vault Kubernetes Authentication

## Overview

Applications inside Kubernetes authenticate securely with Vault.

Authentication Flow

Pod
 ↓
Service Account
 ↓
Vault
 ↓
Temporary Token

Advantages

- No passwords
- Automatic authentication
- Secure workloads

Typical Usage

- Kubernetes Pods
- Microservices
- CI/CD Deployments
