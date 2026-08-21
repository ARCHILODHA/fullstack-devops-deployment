# Cache Eviction Policies

## Overview

Cache eviction is the process of removing entries from a cache when space is limited.

Eviction policies determine which cached items should be removed.

## Common Eviction Policies

### 1. LRU - Least Recently Used

Removes the item that has not been accessed for the longest time.

```text
Cache: A B C D

Access: A
Access: C

LRU order:
B -> D -> A -> C

If space is needed, B is removed.
