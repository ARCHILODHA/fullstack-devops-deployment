# Retry Policy in Service Mesh

## Introduction

Retry Policy automatically retries failed requests before returning an error.

---

## Why Use Retry?

Temporary network issues can cause failures.

Instead of immediately failing, Service Mesh retries the request.

---

## Advantages

- Improves reliability
- Handles temporary failures
- Better user experience

---

## Risks

Too many retries can overload services.

Always configure retry limits.

---

## Supported By

- Istio
- Envoy Proxy
