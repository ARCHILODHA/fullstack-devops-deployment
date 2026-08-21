
# Read-Through Cache

## Overview

In a read-through caching strategy, the cache is responsible for retrieving missing data from the database.

The application communicates primarily with the cache.

## Architecture

```text
Application
     |
   Cache
     |
     +---- Hit ----> Return Data
     |
     +---- Miss
            |
         Database
            |
          Cache
            |
       Return Data
