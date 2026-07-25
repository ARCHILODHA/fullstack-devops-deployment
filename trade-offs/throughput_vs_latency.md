# Throughput vs Latency Trade-off

## Overview
Throughput (requests processed per unit time) and latency (time to process a single request) are both critical performance metrics, but optimizing for one often comes at the expense of the other.

## Throughput
The total volume of work a system can handle in a given time period (e.g., requests/second, transactions/second).

**Optimizing for throughput typically involves:**
- Batching requests together to reduce per-request overhead
- Increasing concurrency/parallelism
- Buffering and queuing to smooth out load spikes

**Trade-off:** Batching and queuing increase the time any individual request waits, increasing latency.

## Latency
The time it takes to process a single request from start to finish.

**Optimizing for latency typically involves:**
- Processing requests immediately, without batching
- Minimizing queuing and buffering
- Prioritizing fast-path execution over maximum resource utilization

**Trade-off:** Processing requests individually and immediately underutilizes resources, reducing overall throughput.

## Why They Conflict
- Batching improves throughput (fewer network round-trips, amortized overhead) but adds wait time for early items in the batch — increasing their latency
- High concurrency improves throughput but can cause resource contention, increasing latency under load (queuing theory — see Little's Law)
- Aggressive caching or precomputation can improve both, but adds complexity and potential staleness

## Little's Law
`L = λ × W` (Average number of items in the system = arrival rate × average wait time). This shows that as arrival rate (load) increases without proportional capacity increases, latency rises even if throughput temporarily holds — a core tension in system design.

## When to Prioritize Throughput
- Batch data pipelines and analytics jobs
- Bulk data ingestion or backup systems
- Systems where total processed volume matters more than per-item speed

## When to Prioritize Latency
- User-facing interactive applications
- Real-time trading, gaming, or communication systems
- APIs with strict SLA response time requirements

## Conclusion
Throughput and latency are fundamentally in tension because techniques that improve one (batching, queuing, high concurrency) often degrade the other. System designers must decide which metric matters more for the specific use case, or design systems (e.g., with configurable batching windows) that can be tuned along this trade-off curve.
