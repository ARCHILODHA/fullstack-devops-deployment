# Exception Logging

Exception logging records unexpected runtime errors.

## Example

```javascript
try {
    riskyFunction();
}
catch(err){
    logger.error(err.message);
}
```

## Benefits

- Faster debugging
- Error tracking
- Better maintenance
