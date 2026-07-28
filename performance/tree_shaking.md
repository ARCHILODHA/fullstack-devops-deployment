# Tree Shaking

## Overview

Tree shaking removes unused JavaScript code during production builds.

---

## Example

```javascript
export function add() {}
export function subtract() {}
```

If only add() is imported, subtract() is removed.

---

## Supported Bundlers

- Webpack
- Rollup
- Vite
- ESBuild

---

## Benefits

- Smaller bundles
- Faster downloads
- Better performance
