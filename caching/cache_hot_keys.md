Cache Hot Keys

A hot key is a cache key that receives an unusually high number of requests compared with other keys.

Hot keys commonly occur in applications that serve popular products, viral posts, trending videos, or frequently accessed user profiles.

How Hot Keys Occur

Consider an e-commerce application where thousands of users request the same popular product.

Thousands of Requests
          |
          v
     Popular Product
          |
          v
      Cache Key

If every request targets the same key, one cache server or shard may become overloaded.

Problems Caused by Hot Keys
Uneven traffic distribution.
Increased CPU and network utilization.
Higher latency.
Overloaded cache nodes.
Potential cascading failures.

Solutions
Replicate frequently accessed values across multiple cache nodes.
Use local in-memory caching to reduce repeated network requests.
Apply request coalescing to combine concurrent cache misses.
Use rate limiting when appropriate.
Monitor request frequency for individual keys.
Example

Suppose a Redis cache stores a popular product:

SET product:501 "Laptop"
GET product:501

If thousands of requests repeatedly access product:501, it may become a hot key.

A local application cache can reduce the number of requests reaching Redis.

Monitoring

Monitor request frequency, latency, CPU utilization, and traffic distribution across cache nodes.

Conclusion

Hot key management is important for maintaining predictable performance in high-traffic applications.
