# JavaScript Performance Optimization

## Overview
JavaScript performance optimization focuses on improving the execution speed, responsiveness, and efficiency of JavaScript applications.

Poorly optimized JavaScript can block the main thread, increase page load time, and create a poor user experience.

## Common Performance Issues

- Excessive DOM manipulation.
- Long-running JavaScript tasks.
- Unnecessary event listeners.
- Large JavaScript bundles.
- Repeated calculations.
- Memory leaks.
- Inefficient loops and algorithms.

## Optimization Techniques

### 1. Avoid Unnecessary DOM Manipulation
Batch DOM updates instead of modifying elements repeatedly.

### 2. Debouncing
Delay function execution until the user stops triggering an event.

```javascript
function debounce(callback, delay) {
    let timer;

    return (...args) => {
        clearTimeout(timer);

        timer = setTimeout(() => {
            callback(...args);
        }, delay);
    };
}

const searchInput = document.querySelector("#search");

searchInput.addEventListener(
    "input",
    debounce((event) => {
        console.log("Searching:", event.target.value);
    }, 300)
);
