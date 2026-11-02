# API Gateway System Design

## 1. Overview

An API Gateway acts as a single entry point for client requests and routes them to appropriate backend services.

It simplifies communication between clients and microservices.

Examples:
- Kong
- Amazon API Gateway
- Spring Cloud Gateway

## 2. Functional Requirements

1. Route incoming requests.
2. Authenticate users.
3. Authorize requests.
4. Apply rate limiting.
5. Load balance backend services.
6. Transform requests and responses.
7. Collect API metrics.
8. Handle errors.
9. Support API versioning.
10. Maintain request logs.

## 3. Non-Functional Requirements

- High availability.
- Low latency.
- Horizontal scalability.
- Fault tolerance.
- Secure communication.
- Observability.

## 4. High-Level Architecture

Clients
   |
   v
Load Balancer
   |
   v
API Gateway Cluster
   |
------------------------------------------------
| Authentication                                |
| Rate Limiting                                 |
| Routing                                       |
| Request Validation                           |
| Logging                                       |
| Metrics                                       |
------------------------------------------------
   |
------------------------------------------------
| User Service                                  |
| Order Service                                 |
| Payment Service                               |
| Product Service                               |
| Notification Service                          |
------------------------------------------------

## 5. Technology Stack

| Component | Technology |
|---|---|
| Gateway | Spring Cloud Gateway |
| Backend | Spring Boot |
| Authentication | JWT / OAuth2 |
| Cache | Redis |
| Service Discovery | Consul / Eureka |
| Monitoring | Prometheus |
| Visualization | Grafana |
| Deployment | Kubernetes |

## 6. Request Flow

1. Client sends an HTTP request.
2. Load balancer selects a gateway instance.
3. Gateway validates authentication.
4. Rate limiter checks request limits.
5. Gateway identifies the target service.
6. Request is forwarded.
7. Backend service processes the request.
8. Gateway returns the response.

## 7. Routing Strategy

Example routing:

/api/users/**      -> User Service
/api/orders/**     -> Order Service
/api/payments/**   -> Payment Service
/api/products/**   -> Product Service

Routing rules can be configured using paths, headers, or request methods.

## 8. Authentication and Authorization

JWT-based authentication:

1. User logs in.
2. Authentication Service issues a signed token.
3. Client sends token with each request.
4. Gateway validates the token.
5. Gateway forwards authorized requests.

Sensitive authorization decisions may still need to be enforced by backend services.

## 9. Rate Limiting

Rate limiting protects backend services from excessive traffic.

Common algorithms:

### Fixed Window
Counts requests within a fixed time interval.

### Sliding Window
Tracks requests over a moving time period.

### Token Bucket
Allows bursts while enforcing an average request rate.

Redis can maintain distributed rate-limit counters.

## 10. Fault Tolerance

Implement:

- Circuit breakers.
- Request timeouts.
- Retry policies for safe operations.
- Health checks.
- Bulkheads.
- Graceful degradation.

Avoid automatically retrying non-idempotent operations without protection.

## 11. Scaling Strategy

- Run multiple gateway instances.
- Use load balancing.
- Keep gateway instances stateless where possible.
- Cache reusable metadata.
- Use distributed rate limiting.
- Monitor request latency and throughput.

## 12. Security

- HTTPS.
- JWT validation.
- API key management where appropriate.
- Input validation.
- Request size limits.
- CORS configuration.
- DDoS protection.
- Sensitive data redaction in logs.

## 13. Monitoring

Important metrics:

- Requests per second.
- Error rate.
- Average latency.
- P95 and P99 latency.
- Rate-limit rejections.
- Backend service availability.

## 14. Important System Design Concepts

- Reverse proxy
- Load balancing
- API routing
- Rate limiting
- Circuit breaker
- Authentication
- Service discovery
- Observability

## 15. Conclusion

An API Gateway centralizes common API concerns and simplifies client communication with microservices.

It must be designed carefully because it sits on the critical path of almost every client request.
