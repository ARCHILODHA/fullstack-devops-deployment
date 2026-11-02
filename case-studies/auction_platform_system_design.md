# Auction Platform System Design

## 1. Overview

An auction platform allows sellers to list products and buyers to place competitive bids within a fixed time window.

Examples:
- eBay Auctions
- Sotheby's online auctions

## 2. Functional Requirements

1. User registration and login.
2. Seller product listing.
3. Auction creation.
4. Auction start and end time.
5. Real-time bidding.
6. Display highest bid.
7. Bid history.
8. Auction winner selection.
9. Payment processing.
10. Notifications.

## 3. Non-Functional Requirements

- Low-latency bidding.
- Strong consistency for bid ordering.
- High availability.
- Fair bid processing.
- Fraud prevention.
- Scalability during popular auctions.

## 4. High-Level Architecture

Clients
  |
Load Balancer
  |
API Gateway
  |
------------------------------------------------
| Authentication Service                       |
| Listing Service                              |
| Auction Service                              |
| Bidding Service                              |
| Payment Service                              |
| Winner Selection Service                     |
| Notification Service                         |
------------------------------------------------
  |
PostgreSQL / Redis / Kafka / WebSockets

## 5. Technology Stack

| Component | Technology |
|---|---|
| Frontend | React |
| Backend | Spring Boot |
| Database | PostgreSQL |
| Cache | Redis |
| Messaging | Kafka |
| Real-time Updates | WebSockets |
| Deployment | Kubernetes |

## 6. Database Design

### Users
- user_id (PK)
- name
- email

### Listings
- listing_id (PK)
- seller_id (FK)
- title
- description
- starting_price

### Auctions
- auction_id (PK)
- listing_id (FK)
- start_time
- end_time
- current_highest_bid
- auction_status

### Bids
- bid_id (PK)
- auction_id (FK)
- bidder_id (FK)
- bid_amount
- created_at

### Payments
- payment_id (PK)
- auction_id (FK)
- winner_id (FK)
- amount
- payment_status

## 7. Bidding Flow

1. User opens an active auction.
2. Client connects through WebSocket.
3. User submits a bid.
4. Bidding Service validates the bid.
5. System checks auction status and current highest bid.
6. Bid is accepted only if it satisfies auction rules.
7. Bid is persisted.
8. Highest bid is updated.
9. Kafka publishes BidAccepted.
10. WebSocket broadcasts the latest bid.

## 8. Preventing Invalid Bids

- Use atomic database transactions.
- Lock auction records during bid validation.
- Enforce bid amount constraints.
- Check auction expiration.
- Use idempotency keys.
- Maintain an immutable bid history.

## 9. Real-Time Architecture

WebSocket Gateway allows the server to push updates to connected clients.

Example:

BidAccepted
    |
Kafka
    |
Auction Update Consumer
    |
WebSocket Gateway
    |
Connected Users

## 10. Redis Usage

Redis can store:

- Current auction snapshots.
- Active auction metadata.
- Temporary bidding counters.
- WebSocket-related presence information.

The authoritative bid history must remain durable.

## 11. Auction Expiration

A scheduler or delayed event mechanism can identify auctions whose end time has passed.

Winner selection should:

1. Verify auction expiration.
2. Read the highest valid bid.
3. Mark the winner.
4. Close the auction.
5. Initiate payment.

The closing operation must be idempotent.

## 12. Scaling Strategy

- Partition auctions by auction_id.
- Distribute WebSocket connections.
- Cache active auction data.
- Use Kafka for bid events.
- Scale bidding consumers carefully.
- Use database indexes on auction_id and bid_amount.

## 13. Security

- Authenticate bidders.
- Prevent bid manipulation.
- Apply rate limiting.
- Detect suspicious bidding patterns.
- Maintain audit logs.
- Protect payment information.

## 14. Important System Design Concepts

- WebSockets
- Real-time processing
- Concurrency control
- Database locking
- Event-driven architecture
- Idempotency
- Distributed systems

## 15. Conclusion

An auction platform requires fair bid processing, low latency, and consistent ordering of bids.

The most important challenge is ensuring that concurrent bids cannot produce incorrect auction results.
