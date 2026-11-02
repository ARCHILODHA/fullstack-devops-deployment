# Ticket Booking System Design

## 1. Overview

A ticket booking platform allows users to discover events, check seat availability, reserve seats, make payments, and receive booking confirmations.

Examples:
- BookMyShow
- Ticketmaster
- Eventbrite

## 2. Functional Requirements

1. User registration and login.
2. Browse movies, events, and venues.
3. Search events by location and date.
4. View available seats.
5. Select and temporarily reserve seats.
6. Make payments.
7. Generate booking confirmations.
8. Cancel bookings and process refunds.
9. View booking history.

## 3. Non-Functional Requirements

- High availability.
- Low response time.
- Strong consistency for seat reservations.
- Scalability during popular ticket releases.
- Secure payment processing.
- Fault tolerance.

## 4. High-Level Architecture

User
  |
Load Balancer
  |
API Gateway
  |
------------------------------------------------
| User Service                                 |
| Event Service                                |
| Search Service                               |
| Seat Inventory Service                      |
| Booking Service                              |
| Payment Service                              |
| Notification Service                         |
------------------------------------------------
  |
Databases / Cache / Message Queue

## 5. Technology Stack

| Component | Technology |
|---|---|
| Frontend | React |
| Backend | Java Spring Boot |
| API Gateway | Spring Cloud Gateway |
| Database | PostgreSQL |
| Cache | Redis |
| Message Queue | Kafka |
| Search | Elasticsearch |
| Payment | Payment Gateway |
| Deployment | Docker + Kubernetes |

## 6. Database Design

### Users
- user_id (PK)
- name
- email
- password_hash

### Events
- event_id (PK)
- event_name
- venue_id
- event_date
- status

### Seats
- seat_id (PK)
- event_id (FK)
- seat_number
- price
- status

### Bookings
- booking_id (PK)
- user_id (FK)
- event_id (FK)
- total_amount
- booking_status
- created_at

### Payments
- payment_id (PK)
- booking_id (FK)
- transaction_id
- amount
- payment_status

## 7. Seat Reservation Flow

1. User selects an event.
2. Frontend requests available seats.
3. Seat Inventory Service retrieves availability.
4. User selects seats.
5. System atomically reserves selected seats.
6. Seats are temporarily locked for 5 minutes.
7. User completes payment.
8. Payment Service confirms the transaction.
9. Booking Service confirms the booking.
10. Notification Service sends the ticket.

## 8. Preventing Double Booking

Double booking occurs when multiple users attempt to reserve the same seat.

Solutions:

- Database transactions.
- Row-level locking.
- Redis-based temporary locks.
- Unique constraints on event_id and seat_id.
- Reservation expiration.

A temporary reservation should have an expiration timestamp.

The system must ensure that only one active booking can own a seat.

## 9. Redis Usage

Redis can store temporary seat reservations.

Example:

seat:event_101:A12 -> user_501

Use atomic operations and expiration times.

Redis locks should be implemented carefully so that expired or stale locks cannot incorrectly block bookings.

## 10. Kafka Usage

Kafka can process asynchronous events:

- PaymentCompleted
- BookingConfirmed
- BookingCancelled
- RefundInitiated
- TicketGenerated

This reduces synchronous dependencies between services.

## 11. Scaling Strategy

- Cache event details.
- Use database indexing.
- Partition booking data by event or date.
- Add read replicas for browsing.
- Use queues during high-demand ticket releases.
- Apply rate limiting to prevent bots.

## 12. Failure Handling

### Payment succeeds but booking confirmation fails
Use a durable payment event and retry booking confirmation.

### User does not complete payment
Expire the temporary seat reservation.

### Notification service fails
Retry notification delivery without reversing a confirmed booking.

### Redis becomes unavailable
Use database-backed reservation transactions as a fallback.

## 13. Important System Design Concepts

- Distributed locking
- Database transactions
- Strong consistency
- Event-driven architecture
- Idempotency
- Rate limiting
- Caching
- Message queues

## 14. Conclusion

A ticket booking system requires strong consistency in seat reservation, reliable payment processing, and scalability during high-demand events.

The most critical design challenge is preventing double booking while maintaining a smooth user experience.
