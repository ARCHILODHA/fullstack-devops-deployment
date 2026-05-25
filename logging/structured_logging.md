
# Structured Logging

## What is Structured Logging?
Logs are stored in JSON or key-value format.

## Advantages
- Easy searching
- Better analytics
- Machine readable

## Example
```js
logger.info({
  event: "UserLogin",
  user: "archi",
  status: "success"
});
