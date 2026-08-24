# Banking System Design

## 1. Overview

A banking system manages customers, accounts, balances, transactions, payments, cards, and financial records. The system must prioritize security, consistency, reliability, and auditability.

## 2. Functional Requirements

- Customer registration and authentication.
- Create and manage bank accounts.
- Deposit and withdraw money.
- Transfer money between accounts.
- View transaction history.
- Generate account statements.
- Support scheduled payments.
- Send transaction notifications.
- Maintain audit logs.

## 3. High-Level Architecture

```text
Client
   |
API Gateway
   |
+--------------------------------+
| Auth Service                   |
| Account Service                |
| Transaction Service            |
| Payment Service                |
| Notification Service           |
+--------------------------------+
   |
+--------------------------------+
| Database | Cache | Message Bus |
+--------------------------------+
