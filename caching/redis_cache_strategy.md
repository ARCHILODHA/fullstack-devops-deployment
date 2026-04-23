# Redis Caching Strategy

## Patterns
- Cache Aside
- Write Through
- Write Back

## Example Flow
1. Check cache
2. If miss → fetch DB
3. Store in Redis

## TTL
Set expiry to avoid stale data
