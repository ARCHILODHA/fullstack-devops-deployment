
# Write-Through Cache

## Overview

In a write-through caching strategy, data is written to the cache and database together.

The cache remains synchronized with the persistent data store.

## Write Flow

```text
Client
   |
Application
   |
Cache
   |
Database
