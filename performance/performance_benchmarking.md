
# Performance Benchmarking

## Overview
Performance benchmarking is the process of measuring an application's performance under defined conditions.

It provides a baseline that can be used to compare different versions, configurations, and optimization techniques.

## Objectives

- Establish performance baselines.
- Compare application versions.
- Identify regressions.
- Evaluate optimization techniques.
- Measure infrastructure efficiency.
- Support capacity planning.

## Types of Benchmarking

### 1. Application Benchmarking
Measures application execution speed and resource consumption.

### 2. Database Benchmarking
Evaluates query execution time and transaction throughput.

### 3. Network Benchmarking
Measures latency, bandwidth, and packet loss.

### 4. Infrastructure Benchmarking
Compares CPU, memory, storage, and server performance.

## Important Metrics

| Metric | Description |
|---|---|
| Throughput | Operations completed per second |
| Latency | Time taken to complete an operation |
| CPU Usage | Processor utilization |
| Memory Usage | RAM consumed by the application |
| Error Rate | Percentage of failed operations |
| p95 Latency | Latency below which 95% of requests complete |
| p99 Latency | Latency below which 99% of requests complete |

## Example: Simple Python Benchmark

```python
import time

def calculate_sum():
    return sum(range(1_000_000))

start_time = time.perf_counter()

result = calculate_sum()

end_time = time.perf_counter()

execution_time = end_time - start_time

print("Result:", result)
print("Execution Time:", execution_time, "seconds")
