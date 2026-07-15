# Security Logging

Security logging records authentication and security-related events.

## Events to Log

- Login attempts
- Logout
- Password changes
- Permission changes
- Unauthorized access
- Token expiration

## Example

```javascript
logger.warn("Failed login attempt", {
    username: "john",
    ip: "192.168.1.5"
});
```

## Benefits

- Detect attacks
- Track suspicious users
- Support auditing
