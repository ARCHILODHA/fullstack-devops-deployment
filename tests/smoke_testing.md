# Smoke Testing

## Objective
Verify that the application is stable enough for further testing after deployment.

## Smoke Test Checklist

- Application starts successfully
- Homepage loads
- API health endpoint returns HTTP 200
- Database connection established
- Login page accessible
- Static assets load correctly
- No critical console errors

## Execution

```bash
npm run smoke-test
```

## Expected Result

All critical functionalities should work without failures.
