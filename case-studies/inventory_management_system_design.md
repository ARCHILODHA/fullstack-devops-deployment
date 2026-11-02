# Inventory Management System Design

## 1. Overview

An inventory management system tracks products, stock levels, warehouses, suppliers, orders, and stock movements.

It is commonly used by retailers, manufacturers, and e-commerce businesses.

## 2. Functional Requirements

1. Add and manage products.
2. Track stock quantities.
3. Manage multiple warehouses.
4. Record stock additions and removals.
5. Reserve inventory for orders.
6. Release expired reservations.
7. Generate low-stock alerts.
8. Manage suppliers.
9. Track stock transfers.
10. Generate inventory reports.

## 3. Non-Functional Requirements

- High availability.
- Accurate stock counts.
- Strong consistency for reservations.
- Scalable product catalog.
- Reliable audit history.
- Fast inventory queries.

## 4. High-Level Architecture

Clients
  |
Load Balancer
  |
API Gateway
  |
------------------------------------------------
| Product Service                              |
| Inventory Service                            |
| Warehouse Service                            |
| Reservation Service                          |
| Supplier Service                             |
| Order Service                                |
| Reporting Service                            |
| Notification Service                         |
------------------------------------------------
  |
PostgreSQL / Redis / Kafka

## 5. Technology Stack

| Component | Technology |
|---|---|
| Frontend | React |
| Backend | Spring Boot |
| Database | PostgreSQL |
| Cache | Redis |
| Messaging | Kafka |
| Search | Elasticsearch |
| Deployment | Docker + Kubernetes |

## 6. Database Design

### Products
- product_id (PK)
- name
- sku
- category
- price

### Warehouses
- warehouse_id (PK)
- name
- location

### Inventory
- inventory_id (PK)
- product_id (FK)
- warehouse_id (FK)
- available_quantity
- reserved_quantity
- updated_at

### Reservations
- reservation_id (PK)
- product_id (FK)
- warehouse_id (FK)
- order_id
- quantity
- expiration_time
- status

### StockMovements
- movement_id (PK)
- product_id (FK)
- warehouse_id (FK)
- movement_type
- quantity
- created_at

### Suppliers
- supplier_id (PK)
- name
- contact

## 7. Inventory Reservation Flow

1. Customer places an order.
2. Order Service requests stock reservation.
3. Inventory Service checks available quantity.
4. Database transaction locks the relevant inventory record.
5. Available quantity is reduced.
6. Reserved quantity is increased.
7. Reservation record is created.
8. Order Service receives confirmation.

## 8. Preventing Overselling

Overselling happens when multiple requests reserve the same remaining stock.

Solutions:

- Atomic SQL updates.
- Database transactions.
- Row-level locking.
- Optimistic locking with version numbers.
- Idempotency keys.

Example atomic update:

UPDATE inventory
SET available_quantity = available_quantity - 1,
    reserved_quantity = reserved_quantity + 1
WHERE product_id = 101
AND warehouse_id = 5
AND available_quantity >= 1;

The application must verify that exactly one row was updated.

## 9. Redis Usage

Redis can cache:

- Product details.
- Stock availability snapshots.
- Warehouse metadata.

The database remains the source of truth for inventory reservations.

## 10. Kafka Usage

Events:

- StockAdded
- StockReserved
- StockReleased
- OrderConfirmed
- StockTransferred
- LowStockDetected

## 11. Stock Reservation Expiration

1. Create reservation with expiration time.
2. Schedule expiration processing.
3. Verify reservation is still pending.
4. Release reserved quantity.
5. Mark reservation as expired.

Expiration must be idempotent to prevent releasing stock multiple times.

## 12. Scaling Strategy

- Partition inventory data by warehouse or product.
- Cache product catalog data.
- Use read replicas for reporting.
- Process notifications asynchronously.
- Use database indexes on SKU and warehouse_id.

## 13. Failure Handling

### Order succeeds but inventory event fails
Use transactional outbox and retry event delivery.

### Duplicate reservation request
Use idempotency keys.

### Warehouse transfer fails
Maintain transfer states and reconcile stock movement records.

## 14. Important System Design Concepts

- Database transactions
- Concurrency control
- Event-driven architecture
- Idempotency
- Inventory reservation
- Distributed systems
- Caching

## 15. Conclusion

An inventory management system must maintain accurate stock levels while handling concurrent orders and warehouse operations.

Preventing overselling and maintaining a reliable stock movement history are its most important challenges.
