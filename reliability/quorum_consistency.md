
# Quorum and Consistency in Distributed Systems

## Overview
Quorum is a technique used in distributed systems to determine how many nodes must participate in a read or write operation.

It helps balance consistency and availability when data is replicated across multiple nodes.

## Why Quorum?

- Improves distributed data reliability.
- Helps coordinate replicated data.
- Supports consistency decisions.
- Reduces dependence on a single node.

## Basic Quorum Concept

Assume a distributed database has N replicas.

- N: Total number of replicas.
- W: Number of replicas required to acknowledge a write.
- R: Number of replicas consulted for a read.

A common quorum condition is:

```text
R + W > N
