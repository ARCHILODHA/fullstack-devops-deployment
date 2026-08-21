
# Cache Coherence

## Overview

Cache coherence refers to keeping multiple cached copies of data consistent.

This becomes important in distributed systems where multiple servers have their own caches.

## Problem

Consider two application servers:

```text
             Database
             /      \
        Server A   Server B
           |          |
        Cache A     Cache B
