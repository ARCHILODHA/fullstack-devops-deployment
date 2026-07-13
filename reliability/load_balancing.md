# Load Balancing

## What is Load Balancing?

Load balancing distributes incoming network traffic across multiple servers to prevent overload and improve reliability.

## Benefits

- High availability
- Better performance
- Fault tolerance
- Scalability

## Types

### Round Robin
Requests are distributed sequentially.

### Least Connections
Traffic goes to the server with the fewest active connections.

### IP Hash
Routes requests based on client IP.

## Popular Load Balancers

- Nginx
- HAProxy
- AWS ELB
- Azure Load Balancer

## Example

User Request
        |
 Load Balancer
   /     |     \
Server1 Server2 Server3
