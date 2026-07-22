# Timeout Policy

## What is Timeout?

A timeout defines how long a service waits for a response.

If no response arrives within the specified time, the request fails.

---

## Benefits

- Prevents hanging requests
- Frees resources
- Improves application responsiveness

---

## Example

Request Timeout = 5 seconds

If Service B doesn't respond within 5 seconds,
Service A stops waiting.

---

## Best Practices

- Set realistic timeout values.
- Avoid very long waiting periods.
- Combine with retries.
