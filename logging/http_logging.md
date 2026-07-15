# HTTP Logging

HTTP logging records every incoming HTTP request.

## Common Data

- URL
- Method
- Status Code
- Response Time
- User Agent

## Example

```javascript
const morgan = require("morgan");
app.use(morgan("combined"));
```

## Popular Tool

Morgan
