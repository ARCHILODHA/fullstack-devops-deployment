# Font Optimization

## Overview

Optimizing fonts improves page rendering speed.

---

## Best Practices

- Use WOFF2 format
- Limit font weights
- Use font-display: swap
- Preload fonts
- Self-host fonts

---

## Example

```css
@font-face {
    font-family: "Roboto";
    src: url("Roboto.woff2") format("woff2");
    font-display: swap;
}
```

---

## Benefits

- Faster text rendering
- Lower CLS
- Improved Core Web Vitals
