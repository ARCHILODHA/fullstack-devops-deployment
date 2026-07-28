# Code Splitting

## Overview

Code splitting divides JavaScript into smaller chunks loaded only when needed.

---

## Example

```javascript
const Dashboard = React.lazy(() => import("./Dashboard"));
```

---

## Benefits

- Smaller initial bundle
- Faster startup
- Better caching

---

## Tools

- React Lazy
- Vite
- Webpack
- Next.js
