# Contract Testing

## 1. Introduction

Contract Testing verifies that two services communicate according to an agreed interface or contract.

It is especially useful in microservices architectures where services are developed and deployed independently.

## 2. What Is Contract Testing?

A contract defines how a consumer interacts with a provider.

It specifies:
- Request structure
- Response structure
- Data types
- Required fields
- HTTP status codes
- Expected behavior

Contract testing checks whether both services follow these expectations.

## 3. Types of Contract Testing

### Consumer-Driven Contract Testing

The consumer defines its expectations, and the provider verifies that it satisfies them.

### Provider-Driven Contract Testing

The provider defines the contract, and consumers validate their compatibility.

## 4. Contract Testing Workflow

1. Consumer defines expected interactions.
2. Contract is generated.
3. Contract is shared with the provider.
4. Provider verifies the contract.
5. Results are reported.
6. Incompatible changes are corrected.

## 5. Example Using Pact

Install Pact for a JavaScript project:

```bash
npm install --save-dev @pact-foundation/pact
