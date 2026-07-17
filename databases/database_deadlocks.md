# Database Deadlocks

## What is a Deadlock?

A deadlock occurs when two transactions wait for each other forever.

Example

Transaction A
- Locks Table A
- Waits for Table B

Transaction B
- Locks Table B
- Waits for Table A

Result

Deadlock

## Prevention

- Access tables in same order
- Keep transactions short
- Use timeout
- Deadlock detection algorithms

## Handling

- Rollback one transaction
- Retry transaction
