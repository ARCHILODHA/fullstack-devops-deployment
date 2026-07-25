# Orchestration vs Choreography Trade-off

## Overview
In microservices architectures, coordinating multi-service workflows can be done via a central orchestrator or via decentralized event-driven choreography.

## Orchestration
A central controller (orchestrator) directs the sequence of service calls, e.g., a workflow engine like Camunda, AWS Step Functions, or a dedicated orchestration service.

**Pros:**
- Clear, centralized view of the entire workflow — easy to understand and monitor
- Simpler error handling and compensation logic (sagas) in one place
- Easier to modify workflow steps without touching individual services

**Cons:**
- Central orchestrator becomes a single point of failure/bottleneck
- Tighter coupling between orchestrator and services
- Orchestrator must know about every service it coordinates

## Choreography
Each service publishes and reacts to events independently, with no central coordinator (event-driven, pub/sub).

**Pros:**
- Loose coupling — services don't need to know about each other directly
- No single point of failure for coordination
- Scales well as new services can subscribe to existing events

**Cons:**
- Harder to trace and debug the overall workflow (no single source of truth)
- Risk of implicit, hard-to-track dependencies between services
- Complex error handling and compensation across distributed events

## Comparison
| Aspect | Orchestration | Choreography |
|---|---|---|
| Coupling | Tighter | Looser |
| Visibility | Centralized, easy to trace | Distributed, harder to trace |
| Failure point | Orchestrator | None (but harder to debug) |
| Complexity growth | Manageable centrally | Can spiral with more events |

## When to Choose Orchestration
- Complex business workflows with many conditional steps
- Need for strong visibility, auditing, and compensation logic
- Long-running processes (order fulfillment, approval workflows)

## When to Choose Choreography
- Simple, loosely related event reactions
- Systems prioritizing service autonomy and independent deployability
- High-scale event-driven systems (e.g., analytics pipelines)

## Conclusion
Orchestration offers control and visibility at the cost of coupling, while choreography offers flexibility and decoupling at the cost of traceability. Many real-world systems use a mix — orchestration for critical business workflows, choreography for peripheral, reactive processes.
