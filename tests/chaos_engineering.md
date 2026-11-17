
# Chaos Engineering

## 1. Introduction

Chaos Engineering is a testing approach that deliberately introduces controlled failures into a system to understand how it behaves under unexpected conditions.

It helps organizations improve the reliability of distributed applications.

## 2. What Is Chaos Engineering?

Chaos Engineering involves experimenting with real system failures in a controlled environment.

Examples include:

- Stopping application containers.
- Introducing network latency.
- Terminating virtual machines.
- Simulating service failures.
- Increasing resource consumption.

## 3. Principles of Chaos Engineering

### Define a Steady State

Identify normal system behavior using measurable indicators.

### Form a Hypothesis

Predict how the system should behave during a failure.

### Introduce Controlled Experiments

Inject failures into selected components.

### Observe Results

Monitor application behavior and system metrics.

### Improve Reliability

Fix weaknesses discovered during experiments.

## 4. Example: Container Failure Experiment

Check running containers:

```bash
docker ps
