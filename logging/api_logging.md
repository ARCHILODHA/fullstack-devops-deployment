# API Logging

API logging stores request and response information.

## Information Logged

- Request URL
- HTTP Method
- Status Code
- Response Time
- Client IP

## Example

```javascript
app.use((req, res, next) => {
    console.log(`${req.method} ${req.url}`);
    next();
});
```

## Advantages

- Easier debugging
- API monitoring
- Performance analysis
