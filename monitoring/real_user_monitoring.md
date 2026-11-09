
# Real User Monitoring (RUM)

## Overview
Real User Monitoring collects performance and experience data from actual users interacting with an application.

Unlike synthetic monitoring, RUM measures real-world usage conditions.

## Why RUM?

- Understand actual user experience.
- Identify slow pages.
- Detect browser-specific issues.
- Monitor geographical performance differences.
- Improve frontend performance.

## Important Metrics

### 1. Core Web Vitals

- LCP: Largest Contentful Paint.
- INP: Interaction to Next Paint.
- CLS: Cumulative Layout Shift.

### 2. Additional Metrics

- Page load time.
- JavaScript errors.
- API request latency.
- Navigation timing.
- Browser and device information.

## Example: Browser Performance API

```javascript
const navigationEntry =
  performance.getEntriesByType("navigation")[0];

if (navigationEntry) {
  console.log("DOM Content Loaded:",
    navigationEntry.domContentLoadedEventEnd);

  console.log("Page Load Time:",
    navigationEntry.loadEventEnd);
}
