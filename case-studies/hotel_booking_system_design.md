
# Hotel Booking System Design

## 1. Overview

A hotel booking system allows customers to search hotels, check room availability, reserve rooms, make payments, and manage bookings.

## 2. Functional Requirements

- Search hotels by location.
- Search rooms by date.
- Filter by price and rating.
- View hotel details.
- Check room availability.
- Reserve rooms.
- Process payments.
- Cancel bookings.
- Send booking confirmations.

## 3. Architecture

```text
Web / Mobile Client
        |
    API Gateway
        |
+--------------------------+
| User Service             |
| Hotel Service            |
| Search Service           |
| Booking Service          |
| Payment Service          |
| Notification Service     |
+--------------------------+
        |
 Database + Cache + Queue
