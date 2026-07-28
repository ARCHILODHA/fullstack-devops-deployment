# Critical Rendering Path

## Overview

The Critical Rendering Path (CRP) is the sequence of steps browsers follow to convert HTML, CSS, and JavaScript into pixels displayed on the screen.

---

## Stages

1. Parse HTML
2. Build DOM
3. Parse CSS
4. Build CSSOM
5. Combine DOM + CSSOM
6. Create Render Tree
7. Layout
8. Paint
9. Composite

---

## Optimization

- Minify CSS
- Minify JavaScript
- Remove unused CSS
- Use async/defer scripts
- Inline critical CSS
- Compress resources

---

## Benefits

- Faster page load
- Better Lighthouse score
- Improved user experience
