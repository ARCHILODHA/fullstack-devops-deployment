
# Request Logging

## Purpose
Tracks incoming API requests.

## Information Logged
- Request URL
- Method
- Response status
- Response time

## Express Middleware Example
```js
app.use((req, res, next) => {
  console.log(`${req.method} ${req.url}`);
  next();
});
