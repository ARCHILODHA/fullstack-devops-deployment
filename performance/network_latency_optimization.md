
# Network Latency Optimization

## Overview
Network latency is the time required for data to travel between two endpoints.

High latency can make applications feel slow even when servers have sufficient processing capacity.

## Causes of Network Latency

- Large geographical distances.
- Network congestion.
- DNS lookup delays.
- TLS handshake overhead.
- Packet loss.
- Inefficient routing.
- Excessive HTTP requests.

## Optimization Techniques

### 1. Use a CDN
Serve static resources from geographically distributed edge locations.

### 2. Enable HTTP/2 or HTTP/3
Use modern HTTP protocols to improve connection efficiency.

### 3. Reduce DNS Lookup Time
Use reliable DNS providers and appropriate DNS caching.

### 4. Reuse Connections
Use persistent connections instead of repeatedly establishing new ones.

### 5. Minimize Request Count
Combine requests where appropriate and remove unnecessary network calls.

### 6. Use Compression
Compress text-based resources before transferring them.

## Measuring Network Latency

Use the `ping` command:

```bash
ping example.com
