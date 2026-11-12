
# Idempotency

## Overview
Idempotency is a property of an operation where performing the same operation multiple times produces the same intended result as performing it once.

It is especially important in distributed systems where requests may be repeated because of network failures or client retries.

## Why Idempotency?

- Prevents duplicate operations.
- Supports safe retries.
- Improves payment processing reliability.
- Handles uncertain network outcomes.
- Reduces inconsistent application state.

## HTTP Idempotent Methods

| HTTP Method | Idempotent |
|---|---|
| GET | Yes |
| HEAD | Yes |
| PUT | Yes |
| DELETE | Yes |
| POST | Not inherently |
| PATCH | Depends on implementation |

## Example: Payment Idempotency

A client sends an idempotency key with a payment request.

```http
POST /api/payments
Content-Type: application/json
Idempotency-Key: payment-order-12345

{
  "amount": 500,
  "currency": "INR"
}
