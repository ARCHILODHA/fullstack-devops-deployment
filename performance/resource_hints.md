# Resource Hints

## Overview

Resource hints tell the browser which resources should be loaded earlier.

---

## Types

### Preload

Loads important resources immediately.

```html
<link rel="preload" href="style.css" as="style">
```

### Prefetch

Downloads resources for future pages.

```html
<link rel="prefetch" href="next-page.js">
```

### Preconnect

Creates early connection.

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
```

### DNS Prefetch

```html
<link rel="dns-prefetch" href="//cdn.example.com">
```

---

## Benefits

- Faster loading
- Lower latency
- Better navigation
