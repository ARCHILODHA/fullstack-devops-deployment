
# Write-Behind Cache

## Overview

Write-behind, also called write-back caching, writes data to the cache first and updates the database asynchronously.

## Architecture

```text
Client
   |
Application
   |
Cache
   |
Message Queue
   |
Database
