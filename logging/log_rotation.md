
# Log Rotation

## Purpose
Prevents log files from consuming too much disk space.

## Benefits
- Better storage management
- Improved performance
- Easier maintenance

## Example with Winston
```js
const DailyRotateFile = require('winston-daily-rotate-file');
