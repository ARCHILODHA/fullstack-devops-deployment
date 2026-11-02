# Stock Trading System Design

## 1. Overview

A stock trading platform allows users to monitor market prices, place buy and sell orders, manage portfolios, and view transaction history.

Examples:
- Zerodha
- Groww
- Robinhood

## 2. Functional Requirements

1. User registration and authentication.
2. KYC verification.
3. View real-time stock prices.
4. Search stocks.
5. Place buy and sell orders.
6. Cancel pending orders.
7. Maintain user portfolios.
8. View order history.
9. Generate transaction reports.
10. Send trade notifications.

## 3. Non-Functional Requirements

- Very low latency.
- Strong consistency for order processing.
- High availability.
- Secure transactions.
- Accurate financial records.
- Fault tolerance.
- Auditability.

## 4. High-Level Architecture

Clients
  |
Load Balancer
  |
API Gateway
  |
------------------------------------------------
| Authentication Service                       |
| KYC Service                                  |
| Market Data Service                          |
| Order Management Service                     |
| Risk Management Service                      |
| Matching Engine                              |
| Portfolio Service                            |
| Payment Service                              |
| Notification Service                         |
------------------------------------------------
  |
PostgreSQL / Redis / Kafka / Market Data Streams

## 5. Technology Stack

| Component | Technology |
|---|---|
| Frontend | React |
| Backend | Java / Spring Boot |
| Database | PostgreSQL |
| Cache | Redis |
| Messaging | Kafka |
| Market Data | WebSocket |
| API Gateway | Spring Cloud Gateway |
| Monitoring | Prometheus + Grafana |

## 6. Database Design

### Users
- user_id (PK)
- name
- email
- kyc_status

### Stocks
- stock_id (PK)
- symbol
- company_name
- exchange

### Orders
- order_id (PK)
- user_id (FK)
- stock_id (FK)
- order_type
- quantity
- price
- order_status
- created_at

### Trades
- trade_id (PK)
- buy_order_id
- sell_order_id
- quantity
- execution_price
- executed_at

### Holdings
- holding_id (PK)
- user_id (FK)
- stock_id (FK)
- quantity
- average_price

### Transactions
- transaction_id (PK)
- user_id (FK)
- amount
- transaction_type
- status

## 7. Order Placement Flow

1. User places a buy or sell order.
2. API Gateway authenticates the request.
3. Order Management Service validates the order.
4. Risk Management Service checks limits and available funds or holdings.
5. Order is persisted.
6. Matching Engine processes eligible orders.
7. Trade execution is recorded.
8. Portfolio Service updates holdings.
9. User receives a notification.

## 8. Matching Engine

The Matching Engine matches buy and sell orders.

Common matching rules:

- Highest buy price gets priority.
- Lowest sell price gets priority.
- Earlier order gets priority when prices are equal.

A price-time priority model is commonly used.

The matching engine should avoid duplicate execution and maintain a durable order history.

## 9. Market Data Architecture

Market data arrives from exchanges or authorized providers.

Flow:

Exchange Feed
    |
Market Data Service
    |
Kafka
    |
Price Processing
    |
Redis
    |
WebSocket Gateway
    |
Clients

## 10. Redis Usage

Redis can store:

- Latest stock prices.
- Frequently accessed market data.
- User session information.
- Short-lived market snapshots.

Redis should not be treated as the only source of truth for financial transactions.

## 11. Kafka Usage

Events:

- OrderPlaced
- OrderAccepted
- OrderRejected
- TradeExecuted
- PortfolioUpdated
- OrderCancelled

## 12. Consistency and Reliability

Financial transactions require careful consistency guarantees.

Use:

- ACID database transactions.
- Idempotency keys.
- Durable order records.
- Append-only audit logs.
- Reconciliation jobs.
- Transactional outbox pattern.

## 13. Scaling Strategy

- Partition market data by stock symbol.
- Distribute WebSocket connections.
- Cache frequently requested prices.
- Separate read-heavy market data from order processing.
- Use horizontally scalable services where appropriate.

## 14. Security

- Multi-factor authentication.
- Encryption in transit and at rest.
- Role-based access control.
- KYC verification.
- Secure API authorization.
- Detailed audit logs.

## 15. Important System Design Concepts

- Low-latency systems
- Order matching
- Event-driven architecture
- ACID transactions
- WebSockets
- Idempotency
- Financial audit logs

## 16. Conclusion

A stock trading platform requires accurate order execution, low-latency market data delivery, and reliable financial records.

The matching engine and order management service are among its most critical components.
