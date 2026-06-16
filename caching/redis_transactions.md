# Redis Transactions

Redis supports transactions using MULTI and EXEC.

## Commands
MULTI
SET user:1 "John"
INCR visits
EXEC

## Benefits
- Atomic execution
- Consistent updates

## Limitations
- No rollback support
